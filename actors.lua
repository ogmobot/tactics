--! actors.lua

--[[
functions:
    can_afford
    deduct_resource
    push_action
]]--

parse_cost = function(cost)
    qty, resource_name = string.match(cost, "^%s*(%d+)%s*(.*)$")
    return tonumber(qty), resource_name
end

can_afford = function(actor, costs)
    for _, cost in pairs(costs) do
        qty, resource_name = parse_cost(cost)
        if (actor[resource_name] == nil) or (actor[resource_name] < qty) then
            return false
        end
    end
    return true
end

deduct_resource = function(actor, cost)
    -- cost is a string, e.g. "1 action"
    qty, resource_name = parse_cost(cost)
    if actor[resource_name] then
        actor[resource_name] = actor[resource_name] - qty
        return actor[resource_name]
    else
        return nil
    end
end

push_action = function(stack, actor, action)
    if action.costs then
        if can_afford(actor, action.costs) then
            for _, cost in pairs(action.costs) do
                deduct_resource(actor, cost)
            end
        else
            return nil
        end
    end
    stack_event = {
        origin = actor,
        action = action,
    }
    push(g.stack, stack_event)
    return stack_event
end


