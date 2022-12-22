local random = function()
    math.randomseed(os.time())
    return (math.random()*math.random()) / (math.random()*math.random())
end
