module(..., package.seeall);

class "Wall"

function Wall:Wall(width, height, posX, posY)
    self.shape = ScreenShape(SHAPE_RECT, width, height)
    self.shape:setColor(0,0,0,1)
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(posX, posY)
    screen:addPhysicsChild(self.shape, ENTITY_RECT, true)
end

