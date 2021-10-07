require("draw")
require("actors")

g = {}
g.stack = {}

push = table.insert
pop = table.remove

resolve_stack = function(stack)
    stack_event = pop(stack)
    origin = stack_event.origin or nil
    action = stack_event.action or {}
end

love.load = function()
    push(g.stack, "foo")
    push(g.stack, "bar")
    actor = {action=2}
    deduct_resource(actor, "1 action")
    push(g.stack, actor.action)
end

love.update = function()
end
