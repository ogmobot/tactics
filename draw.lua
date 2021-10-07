--! draw.lua

--[[
functions:
    love.draw

expects global table `g` to exist
]]--

love.draw = function()
    local yval = 20
    for _, name in pairs(g.stack) do
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("'"..name.."'", 20, yval)
        yval = yval + 40
    end
end
