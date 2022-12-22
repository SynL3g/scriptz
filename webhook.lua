local function req(url, method, body, headers)
    local HttpService = game:GetService("HttpService")
    
    local url =     url
    local method =  method
    local body =    body
    local headers = headers
    
    local encode = HttpService:JSONEncode(body);
    
    local requests = http_request or request or HttpPost or syn.request or fluxus.request
    local send = {Url = url, Body = encode, Method = method, Headers = headers}
    if send.StatusCode ~= 204 then
         error("Error: "..send.reason); return
    end
end

--[[
    
req(

    "https://discord.com/api/webhooks", -- // Url name
    "POST", -- // Method
    {["content"] = "hello"}, -- // body
     {["content-type"] = "application/json"} -- // Header

)
