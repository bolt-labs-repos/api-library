<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>

<div align="center">
    <img src="https://avatars.githubusercontent.com/u/113652827" alt="Logo" width="80" height="80">
    <h2 style='font-size: 25px;font-weight:bold;text-align:center;'>Bolt Labs API Library</h2>
<p>Developer Resource</p>
	<div>
		<img alt="GitHub" src="https://img.shields.io/github/license/bolt-labs-repos/api-library">
		<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/bolt-labs-repos/api-library">
		<img alt="GitHub release (release name instead of tag name)" src="https://img.shields.io/github/v/release/bolt-labs-repos/api-library">
	</div>
</div>

## Description
This lightweight library was specifically designed for UI-focused resource development. Throughout the process, we realized the need to repeatedly create boilerplate code to effectively communicate with the backend of our resources. In our search for a streamlined solution, we conceptualized a drag-and-drop library that places strong emphasis on simplicity and a straightforward data structure.

## Join US

If you require any assistance or have suggestions, we encourage you to join our Discord community. We provide dedicated channels where you can seek help and support. Your active participation is highly valued, and we are here to address any queries or provide guidance as needed.
[Discord Invite](https://discord.gg/kbJcDNYhaP)

## Getting Started
1. Download the Library: Go to the release section and obtain the latest version of the library. It's a single file, making it easy to download.
2. Install the Library: Copy the file to your desired location within your resource.
3. Configure Your Resource: Simply add the following snippet to your `fxmanifest.lua` file.
   
```lua
shared_scripts {
   "{YOUR_PATH}/api-lib.lua"
}
```

## Usage
### Client Middleware
To ensure registration of callbacks received from FiveM's NUI, we need to create a client file. You can choose any name you prefer, but for the sake of simplicity, let's name it `middleware.lua`. In this file, all you have to do is add the following method.

```lua
API:RegisterEndpoints({
    -- Endpoints
})
```

To register your desired endpoints, simply add them to the table as strings. It should follow a format similar to this example:
> Important! You have the freedom to choose any names for these paths. In this demonstration, I'll be using standard Web API conventions.

```lua
API:RegisterEndpoints({
    "/api/test",
    "/api/test/2"
})
```

### Server Request
Adding your endpoints to the server is a straightforward process. Open the file where you want to define your route and add the following snippet at the top of the file (although it can be placed anywhere, the top is usually the easiest):

```lua
router = API.Router
```

It's worth mentioning that you're not required to follow this approach, but it helps keep your code clean and maintainable, especially as your resource expands.

#### Defining a Route
Defining a route is a simple process. By adding the following code, you can define your desired route:

```lua
-- Any value you return from this function will be sent back to the NUI.
router:Register("/api/test", function(req)
    local data = {}
    return data
end)
```

As you can see, this code snippet accepts one parameter. This parameter grants you access to the request data, which currently includes only the body for exchanging data between the server and NUI. In the future, additional request options will be supported.
