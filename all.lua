package.path = "/etc/conky/conkor/?.lua"
require 'rings' --for scriptA.lua ".lua" is not required here
require 'imageloader'

function conky_main()
     conky_rings()
     conky_image()
end