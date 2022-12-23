-- // https://github.com/Gork3m/Lovense.lua/blob/main/client.lua

local Lovense = LovenseSession:new("")

local oscillate = function()
    for i = 2, math.huge do
        if i == 18 then i = 2 end;
        Lovense:Vibrate(i)
    end 
end

if Lovense:Connect() then
    oscillate()
end
