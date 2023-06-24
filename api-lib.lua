_G.API = {} or _G.API

-- Event Names
Internal = {}
Internal.Events = {
    ServerCallback = "API_REQ_CALLBACK",
    ClientCollection = "API_REQ_COLLECT"
}

-- Server Logic
if (IsDuplicityVersion()) then
    -- Router object for server.
    _G.API.Router = {} or _G.API.Router
    _G.API.Router.Paths = {} or _G.API.Router.Paths

    function _G.API.Router:Register(path, callback)
        if (not _G.API.Router.Paths[path]) then
            _G.API.Router.Paths[path] = callback
        end
    end

    RegisterNetEvent(Internal.Events.ServerCallback, function(path, meta)
        local netId = source
        local response = _G.API.Router.Paths[path](meta)
        TriggerClientEvent(Internal.Events.ClientCollection, netId, path, response)
    end)
end

-- Client Logic
if (not IsDuplicityVersion()) then
    -- Run Client Code
    _G.API.Callbacks = {}
    activeRequest = false

    -- Middleware for client state.
    function _G.API:ClientMiddleware(path, callback, meta)

        if (not _G.API.Callbacks[path]) then 
            _G.API.Callbacks[path] = callback
        end

        TriggerServerEvent(Internal.Events.ServerCallback, path, meta)
    end

    function _G.API:Request(path, opts)
        local method<const> = opts.method or "GET"

        -- Wait for the request buffer to clear.
        -- todo: Turn this into multi-request system.
        while activeRequest do Wait(0) end

        -- Set that one request is active.
        activeRequest = true

        -- Init promise.
        p = promise.new()

        self:ClientMiddleware(path, function(...)
            p:resolve({...})
        end, opts)

        local promise = Citizen.Await(p)
        activeRequest = false
        return table.unpack(promise)

    end

    function _G.API:RegisterEndponts(endpoints)
        for _, endpoint in pairs(endpoints) do
            RegisterNUICallback(endpoint, function(data, response)
                local data = self:Request(endpoint, data)
                response(data)
            end)
        end
    end

    -- Client Collection AddEventHandler
    RegisterNetEvent(Internal.Events.ClientCollection, function(path, res)
        _G.API.Callbacks[path](res)
    end)
end