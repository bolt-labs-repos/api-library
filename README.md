<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>

<div style="width:100%;display:flex;justify-content:center">
		<h2 style='font-size: 25px;font-weight:bold;text-align:center;'>Bolt Labs API Library</h2>
		<img style='margin:0 7px;' src='https://img.shields.io/github/v/release/bolt-labs-repos/api-library?label=version&style=plastic'/>
		<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/bolt-labs-repos/api-library?style=plastic&color=F59E0B">
</div>

## Description
This lightweight library was designed specifically for the development of a UI-focused resource. Throughout the process, We realized the need to repeatedly create boilerplate code to effectively communicate with the backend of my resource. In my search for a streamlined solution, I conceptualized a drag-and-drop library that places a strong emphasis on simplicity and a straightforward data structure.

## Getting Started
1. Download the Library: Go to the release section and obtain the latest version of the library. It's a single file, making it easy to download.
3. Install the Library: Copy the file to your desired location within your resource.
4. Configure Your Resource: Simply add the following snippet to your `fxmanifest.lua` file.
   
```lua
shared_scripts {
   "{YOUR_PATH}/api-lib.lua"
}
```

## Usage
### Client Middleware
To ensure registration of callbacks received from FiveM's NUI, we need to create a client file. You can choose any name you prefer, but for the sake of simplicity, let's name it middleware.lua. In this file, all you have to do is add the following method.
```lua
API:RegisterEndponts({
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
