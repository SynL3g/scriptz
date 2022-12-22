--[[
// by leghat
    // report moment
       // realeasing cus patched (kinda) roblox's report system changed
        \\
    \\
\\
]]


if syn then error("executer does not support this script, will not run properly") end
local players = game:GetService("players")
local lp = players.LocalPlayer
local whitelist = {}

if syn == nil then
    players.PlayerAdded:Connect(function(v)
        if (v ~= lp and not table.find(whitelist, v.name)) then
            game.Players:ReportAbuse(v, "Cheating/Exploiting","They keep racial slurs in using chat exploits. " .. math.random(1, 3e7))
            print("Kick request sent to " .. v.Name)
            wait(3)
        end
    end)
end
coroutine.wrap(function()
    for _, v in next, players:GetPlayers() do
        if (v ~= lp and not table.find(whitelist, v.name)) then
            game.Players:ReportAbuse(v, "Cheating/Exploiting", "They keep racial slurs in using chat exploits. " .. math.random(1, 3e7))
            print("Kick request sent to " .. v.Name)
            wait(3)
        end
    end
end)()
