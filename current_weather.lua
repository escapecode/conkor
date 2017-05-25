--package.path = "/etc/conky/?.lua"
http = require("socket.http")
json = require("cjson")
local util = require "cjson.util"

function main()
	show_weather_json()
end

function show_weather_json()
	--json = (loadfile "/etc/conky/JSON.lua")() -- one-time load of the routines

	--local weather_table = json.decode(util.file_load("/etc/conky/weather.json"))
	local weather_json = http.request("http://api.wunderground.com/api/b2b4a1ad0a889006/geolookup/conditions/q/MI/Reed_City.json");
	local weather_table = json.decode(weather_json);

	--print (weather_table["current_observation"]["icon_url"])
	print (weather_table["current_observation"]["weather"] .. "   " .. weather_table["current_observation"]["temp_f"] .. "F   " .. weather_table["current_observation"]["wind_mph"] .. "mph")

	--local raw_json_text    = json:encode(lua_table_or_value)        -- encode example
	--local pretty_json_text = json:encode_pretty(lua_table_or_value) -- "pretty printed" version

	get_weather_image(weather_table["current_observation"]["icon_url"])
end

function get_weather_image(url)
	local f=io.popen("curl --max-time 60 '" .. url .. "'")
	local imageresp=f:read("*a")
	f:close()
	local imagefile = io.open("/tmp/weather.gif", "w")
	imagefile:write(imageresp)
	imagefile:close()
end

main()