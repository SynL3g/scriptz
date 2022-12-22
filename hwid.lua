-- // haven't checked

local requests = http_request or request or HttpPost or syn.request or fluxus.request
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "krnl-hwid", "Sw-Fingerprint", "Flux-Fingerprint"}
assert(requests, "Executer not supported.");

local HttpService = game:GetService("HttpService")
local httpbin = false
local body = requests({Url = "https://httpbin.org/get"; Method = "GET"}).Body
local decoded = HttpService:JSONDecode(body);

if body.StatusCode == 200 then httpbin = true end;
if httpbin == false then
    pcall(function()
        while true do end
    end)
    game:Shutdown()
end

local gothwid = false
for i, v in next, hwid_list do
    if decoded.headers[v] then
        hwid = decoded.headers[v];
        gothwid = true
        break
    end
end

if not hwid or gothwid == false then error("suck my dick") end;
