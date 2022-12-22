-- Made by LegHat/Atomic and Pneuma

-- Fixed bug 25/11/2022

local blockpost = false -- // If set to true, this will block all POST requests like shitty discord webhook IP grabbers sent through your executer or whatever (this is togglable due to most preimum scripts checking statuscode)

if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end
local closures = newcclosure or syn_newcclosure or nil
local check = KRNL_LOADED or getexecutorname or syn

assert((check or closures) or (hookmetamethod or hookfunction), "Shit Exploit");

local HGet = {}
local HPost = {}
local GObjects = {}

-- Clears for when you re-execute the script
HGet = {}
HPost = {}
GObjects = {}

local function rprint(color, msg)
    rconsoleprint("@@" ..color.. "@@")
    rconsoleprint(msg)
end

local function rrprint(color, msg)
    rprint("WHITE", "\n[")
    rprint(color, msg)
    rprint("WHITE", "]: ")
end

rconsoleclear()
rconsolename("R3bugSpy")
rprint("RED", [[
    _______    _______  _______   ____  ____   _______   ________  _______  ___  ___  
    /"      \  /"     "||   _  "\ ("  _||_ " | /" _   "| /"       )|   __ "\|"  \/"  | 
   |:        |(: ______)(. |_)  :)|   (  ) : |(: ( \___)(:   \___/ (. |__) :)\   \  /  
   |_____/   ) \/    |  |:     \/ (:  |  | . ) \/ \      \___  \   |:  ____/  \\  \/   
    //      /  // ___)_ (|  _  \\  \\ \__/ //  //  \ ___  __/  \\  (|  /      /   /    
   |:  __   \ (:      "||: |_)  :) /\\ __ //\ (:   _(  _|/" \   :)/|__/ \    /   /     
   |__|  \___) \_______)(_______/ (__________) \_______)(_______/(_______)  |___/      
    ------------------------------------------------------------------------------
   |                                                                              |
   |                                                                              |
   |                                   By:                                        |
   |                              Newtomic#2191                                   |
   |                          (1043958558233989170)                               |
   |                       ----------------------------                           |
   |      (https://raw.githubusercontent.com/R3bug/scriptz/main/R3bugSpy.lua)     |
   |                                                                              |
   |                                                                              |
   |______________________________________________________________________________|
                           
   
]])
rconsolename("R3bugSpy: HttpGet: |" ..#HGet.. "| HttpPost |" ..#HPost.. "| GetObjects: |" ..#GObjects.. "|")

if getgenv().discordsexgifs then return end

local ncs = { "HttpGet", "HttpPost", "HttpGetAsync", "HttpPostAsync", "GetObjects" }
for i = 1, #ncs do
    ncs[ncs[i]] = true
end
local oldnc; oldnc = hookmetamethod(game, "__namecall", closures(function(a, b, ...)
    local nc = getnamecallmethod()
    if ncs[nc] then
        -- HttpGet or HttpGetAsync
        if (nc:sub(1, 7) == "HttpGet") then
            do
                table.insert(HGet, {})
                rrprint("GREEN", "HttpGet")
                rprint("LIGHT_RED", string.format("%s", tostring(b)))
                print("HttpGet: ")
                print(string.format("%s", tostring(b)))
                rconsolename("R3bugSpy: HttpGet: |" ..#HGet.. "| HttpPost |" ..#HPost .. "| GetObjects: |" ..#GObjects.. "|")
            end
            -- HttpPost or HttpPostAsync
        elseif (nc:sub(1, 8) == "HttpPost") then
            local data = ...
            do
                table.insert(HPost, {})
                rrprint("GREEN", "HttpPost")
                rprint("LIGHT_RED", string.format("%s", tostring(b)))
                rrprint("RED", "HttpPost")
                rprint("LIGHT_BLUE", string.format(" %s", tostring(data)))
                print("HttpPost: ")
                print(string.format("Url: %s", tostring(b)))
                print(string.format("data: %s", tostring(data)))
                rconsolename("R3bugSpy: HttpGet: |" ..#HGet.. "| HttpPost |" ..#HPost .. "| GetObjects: |" ..#GObjects.. "|")
            end
            -- GetObjects
        elseif (nc == "GetObjects") then
            do
                table.insert(GObjects, {})
                rrprint("GREEN", "GetObjects")
                rprint("LIGHT_RED", string.format("%s", tostring(b)))
                print("GetObjects: ")
                print(string.format("Url: %s", tostring(b)))
                rconsolename("R3bugSpy: HttpGet: |" ..#HGet.. "| HttpPost |" ..#HPost .. "| GetObjects: |" ..#GObjects.. "|")
            end
        end
    end
    return oldnc(a, b, ...)
end))

-- AntiKick

local o1d; o1d = hookmetamethod(game, "__namecall", closures(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" or method == "kick" then
        rrprint("BLUE", "AntiKick")
        rprint("WHITE", "kick attempt prevented")
        return print("kick attempt prevented"), wait(9e9)
    end
    return o1d(self, ...)
end)); local o2d; o2d = hookmetamethod(game, "__namecall", closures(function(...) -- AntiSelfReport
    local method = getnamecallmethod()
    if method == "ReportAbuse" then
        rrprint("BLUE", "ReportAbuse")
        rprint("WHITE", "attempt to use malicious function prevented")
        return print("attempt to use malicious function prevented")
    end
    return o2d(...)
end))

rrprint("CYAN", "INFO")
rprint("WHITE", "Functions hooked:")

--[[
local wsc =  WebSocket.connect or syn.websocket.connect
local old; old = hookfunction(wsc, function(...)
    do
        rprint("RED", "\nWebSocket connection blocked:")
        rprint("LIGHT_RED", "\n "..(...))
        print("WebSocket connection blocked:")
        return print(...)
    end
   return old(...)
end)
]]

local requests = http_request or request or HttpPost or syn.request or fluxus.request
local old; old = hookfunction(requests, function(req, ...)
	local start = os.time()
	if req.Url then
		print(string.format("Url: %s", tostring(req.Url)))
    rprint("LIGHT_RED", string.format([[

{
	["Url"] = "%s",
}
		]], req.Url))
	else
		print(string.format("Url: %s", "N/A")) -- ¯\_(ツ)_/¯
		rprint("LIGHT_RED", string.format([[

{
    ["Url"] = "%s",
}
		]], "N/A"))
	end

	if req.Body then
		print(string.format("Body: %s", tostring(req.Body)))
		rprint("LIGHT_RED", string.format([[
{
	["Body"] = "%s",
}
		]], req.Body))
	else
		print(string.format("Body: %s", "N/A"))
		rprint("LIGHT_RED", string.format([[
{
    ["Body"] = "%s",
}
		]], "N/A"))
	end

	if req.Method then
		print(string.format("Method: %s", tostring(req.Method)))
		rprint("LIGHT_RED", string.format([[
{
	["Method"] = "%s",
}
		]], req.Method))
	else
		print(string.format("Method: %s", "N/A"))
		rprint("LIGHT_RED", string.format([[
{
    ["Method"] = "%s",
}
		]], "N/A"))
	end

	rprint("LIGHT_RED", "\n\n  Headers: ")
	print("Headers: ")
	if (type(req.Headers) == "table") then
		for i, v in next, req.Headers do
			if (type(v) == "table") then
				for i, v in next, v do
					rprint("LIGHT_RED", "\n        - " .. i .. ": " .. v)
					print(i .. ": " .. v)
				end
			else
				rprint("LIGHT_RED", " " .. i .. ": " .. v)
				print(i .. ": " .. v)
			end
		end
	else
		rprint("LIGHT_RED", "N/A")
		print("N/A")
	end

	rprint("LIGHT_RED", "\n\n  Cookies: ")
	print("Cookies: ")
	if (type(req.Cookies) == "table") then
		for i, v in next, req.Cookies do
			if (type(v) == "table") then
				for i, v in next, v do
					rprint("LIGHT_RED", "\n        - " .. i .. ": " .. v)
					print(i .. ": " .. v)
				end
			else
				rprint("LIGHT_RED", "\n        - " .. i .. ": " .. v)
				print(i .. ": " .. v)
			end
		end
	else
		rprint("LIGHT_RED", "N/A")
		print("N/A")
	end

    if blockpost == true then
        if req.Method then
            if string.find(req.Method, "POST") then
                rprint("RED", "\nPost request blocked.")
                return print("Request blocked in " .. tick() - start .. " seconds"), rprint("LIGHT_RED", "Request blocked in " .. tick() - start .. " seconds")
            end
        end
    end

	return old(req, ...)
end)

rrprint("CYAN", "INFO")
rprint("WHITE", "Logs:")

getgenv().discordsexgifs = true
