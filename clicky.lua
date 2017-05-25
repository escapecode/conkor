
ROOT_WINDOW = "ROX-Filer"
CONKOR_PATH = "/etc/conky/conkor"

myProcesses = {
	hiawatha = {
		itemX = 9,
		itemY = 33,
		start = "/etc/init.d/rc.httpd start",
		stop = "/etc/init.d/rc.httpd stop"
	},
	mysqld = {
		itemX = 40,
		itemY = 33,
		start = "/etc/init.d/rc.mysqld start",
		stop = "/etc/init.d/rc.mysqld stop"
	},
	smbd = {
		itemX = 80,
		itemY = 33,
		start = "/etc/init.d/rc.samba start",
		stop = "/etc/init.d/rc.samba stop"
	},
	['pure-ftpd'] = {
		itemX = 129,
		itemY = 33,
		start = "pure-ftpd -bBADHk 90",
		stop = "killall pure-ftpd"
	},
	minidlna = {
		itemX = 175,
		itemY = 33,
		start ="/usr/bin/minidlna_start",
		stop = "killall minidlnad"
	},
	avserver = {
		itemX = 211,
		itemY = 33,
		start ="avserver",
		stop = "killall avserver"
	},
	ciwiki = {
		itemX = 273,
		itemY = 33,
		start ="su -c '/usr/bin/ciwiki -a' - spot",
		stop = "killall ciwiki"
	},
	weather = {
		itemX = 251,
		itemY = 64,
		start ="/usr/bin/googlechrome --window-size=300,300 -app='https://www.google.com/search?sclient=psy-ab&site=&source=hp&btnG=Search&q=weather'",
		stop = ""
	},
	processes = {
		itemX = 8,
		itemY = 137,
		start ="lxtask",
		stop = ""
	},
	stocks = {
		itemX = 8,
		itemY = 300,
		start ="/usr/bin/googlechrome --window-size=300,300 -app='https://www.google.com/finance/'",
		stop = ""
	},
	news = {
		itemX = 8,
		itemY = 375,
		start ="/usr/bin/googlechrome --window-size=300,300 -app='https://news.google.com'",
		stop = ""
	},
	picture = {
		itemX = 240,
		itemY = 150,
		start ="/usr/bin/googlechrome --window-size=300,300 -app='https://upload.wikimedia.org/wikipedia/commons/a/a9/R_Systems_Data_Center.jpg'",
		stop = ""
	}
}

function runOSCommand(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

function dateStrToUnix(strDate)
    y,m,d,h,i,s = strDate:match("(%d+)-(%d+)-(%d+)%s+(%d+):(%d+):(%d+)")
    --return string.format("%04d%02d%02d%02d%02d",y,m,d,h, i, s)
    return os.time({year=y, month=m, day=d, hour=h, min=i, sec=s})
end

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function setup_xdotool()
	--if #arg == 0  then
		--print('no arguments so restarting xdotool')
		--os.execute("killall xdotool && echo 'xdotool stopping' &")
		--os.execute("xdotool search --class 'Conky' behave %@ focus exec lua " .. CONKOR_PATH .. "/clicky.lua go && echo 'xdotool starting' &")
	--else
		if runOSCommand("ps -ef | grep xdotool | grep -v grep | awk '{print $2}'", false) == '' then
			print('xdotool not running, restarting')
			os.execute("xdotool search --class 'Conky' behave %@ focus exec lua " .. CONKOR_PATH .. "/clicky.lua")
		else
			print("xdotool already running " .. runOSCommand("ps -ef | grep xdotool | grep -v grep | awk '{print $2}'", false))
		end
	--end
end

function go()
	local height=20
	local width=30

	mouseX, mouseY=getMouseCoords()

	for key, value in pairs(myProcesses) do
		print(key .. ' (' .. value['itemX'] .. ':' .. value['itemY'] .. ') - (' .. mouseX .. ':' .. mouseY .. ')')

		if mouseX >= value['itemX'] and mouseX <= (value['itemX'] + width) and mouseY >= value['itemY'] and mouseY <= (value['itemY'] + height) then
			print('------ found ' .. key)
			handleProcess(key)
		end
	end
end

function handleProcess(process_name)
	runOSCommand("xdotool search --onlyvisible " .. ROOT_WINDOW .. " windowfocus $@")
	pid = runOSCommand("netstat -tupan | grep " .. process_name .. " | grep LISTEN | awk '{print $7}' | cut -d/ -f1")
	if pid == nil or pid == '' then
		print(myProcesses[process_name]['start'])
		runOSCommand(myProcesses[process_name]['start'] .. " & ")
	else
		print(myProcesses[process_name]['stop'])
		runOSCommand(myProcesses[process_name]['stop'])
	end
end

function getMouseCoords()
	local click = runOSCommand("xdotool search --class 'Conky' getmouselocation")
	local s, f, mousex=string.find(click, "x%p(%d*)%s")
	local s, f, mousey=string.find(click, "y%p(%d*)%s")

	local geometry = runOSCommand("xwininfo -name 'Conky' | grep 'Absolute'", true)
	s, f, abstlx=string.find(geometry, "X%p%s*(%d*)")
	s, f, abstly=string.find(geometry, "Y%p%s*(%d*)")

	mouseX=tonumber(mousex)-abstlx
	mouseY=tonumber(mousey)-abstly
	return mouseX, mouseY
end

function main()
	if file_exists("/tmp/xdo") == true then
		print("timestamp")
		time_string = runOSCommand("stat /tmp/xdo | grep Modify", false)
		file_unix_timestamp = dateStrToUnix(time_string)
		print(time_string .. ' ' .. file_unix_timestamp)

		local expire_time = 3

		print('checking')
		print(file_unix_timestamp .. '  > ' .. os.time() .. ' ' .. os.time() - expire_time)
		print(file_unix_timestamp - (os.time() - expire_time))

		if file_unix_timestamp > (os.time() - expire_time) then
			print('do not run yet')
			return
		end
	end

	runOSCommand("touch /tmp/xdo")

	setup_xdotool()
	go()
	--if #arg > 0  then
		--go()
	--end
end

main()
