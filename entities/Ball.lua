class "Ball" (EventHandler)

function Ball:Ball()
    self.shape = ScreenShape(SHAPE_CIRCLE, 10, 10)
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(320,240)

    local friction = 0.1
    local density = 0       -- weight of the object
    local restitution = 5   -- bounce of the object
    screen:addPhysicsChild(self.shape, ENTITY_CIRCLE, false, friction, density, restitution)
end

