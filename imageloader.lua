require 'cairo'
require 'imlib2'
--http = require("socket.http")
--json = require("json")

local function networkListener( event )
    if ( event.isError ) then
        print ( "Network error - download failed" )
    else
        event.target.alpha = 0
        transition.to( event.target, { alpha = 1.0 } )
    end

    print ( "event.response.fullPath: ", event.response.fullPath )
    print ( "event.response.filename: ", event.response.filename )
    print ( "event.response.baseDirectory: ", event.response.baseDirectory )
end

function getweatherimage()
	print("/tmp/path-close.jpg")
	local f=io.popen("curl --max-time 60 'http://asdf.com/a.jpg' | sed 's/%//g'")
	local imageresp=f:read("*a")
	f:close()
	local imagefile = io.open("/tmp/path-close.jpg", "w")
	imagefile:write(imageresp)
	imagefile:close()
end

function conky_image()
	--getweatherimage()
	--local show = imlib_load_image("/tmp/path-close.jpg")
	local show = imlib_load_image("/usr/share/backgrounds/default.png")
	if show == nil then return end
	imlib_context_set_image(show)
	imlib_context_set_image(show)
	local scaled=imlib_create_cropped_scaled_image(0, 0, imlib_image_get_width(), imlib_image_get_height(), 50, 50)
	imlib_free_image()
	imlib_context_set_image(scaled)
	imlib_render_image_on_drawable(235, 150)
	imlib_free_image()
	-- conky_window.display.loadRemoteImage( "http://coronalabs.com/images/coronalogogrey.png", "GET", networkListener, "path-close.png", system.TemporaryDirectory, 50, 50 )
end
