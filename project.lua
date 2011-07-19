screen = PhysicsScreen(1, 60)

class "Wall"

function Wall:Wall(width, height, posX, posY)
    self.shape = ScreenShape(SHAPE_RECT, width, height)
    self.shape:setColor(0,0,0,1)
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(posX, posY)
    screen:addPhysicsChild(self.shape, ENTITY_RECT, true)
end

-- end of Wall class

class "Player" (EventHandler)

function Player:Player(x, y, human_player)
    self.shape = ScreenShape(SHAPE_RECT, 10, 100)
    self.shape:setPosition(x,y)
    screen:addCollisionChild(self.shape, ENTITY_RECT)

    if human_player == true then
        self:EventHandler()

        Services.Core:getInput():addEventListener(self, EVENT_KEYUP)
        Services.Core:getInput():addEventListener(self, EVENT_KEYDOWN)
    end
end

function Player:handleEvent(e)
    if e:getDispatcher() == Services.Core:getInput() then
        local inputEvent = InputEvent(e)
        local key = inputEvent:keyCode()
        
        if e:getEventCode() == EVENT_KEYDOWN then
            if key == KEY_UP then
                local pos = self.shape:getPosition()
                
                -- NOTES: screen measurement is from top/left(0) to down/right(n)
                self.shape:setPosition(pos.x, pos.y-25)
            elseif key == KEY_DOWN then
                local pos = self.shape:getPosition()
                self.shape:setPosition(pos.x, pos.y+25)
            end
        elseif e:getEventCode() == EVENT_KEYUP then
            if key == KEY_DOWN or key == KEY_UP then
                -- do something
            end
        end
    end
end

-- end of player class

class "Ball" (EventHandler)

function Ball:Ball()
    self.shape = ScreenShape(SHAPE_CIRCLE, 10, 10)
    --self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(320,240)
    local friction = 0.1
    local density = 0       -- weight of the object
    local restitution = 5   -- controls bounce
    screen:addPhysicsChild(self.shape, ENTITY_CIRCLE, false, friction, density, restitution)
end

-- end of Ball class

human = Player(15, 480/2, true)
computer = Player(625, 480/2, false)
ball = Ball(640/2, 480/2)

leftWall = Wall(10, 480, 5, 480/2)
rightWall = Wall(10, 480, 635, 480/2)
topWall = Wall(640, 10, 640/2, 5)
bottomWall = Wall(640, 10, 640/2, 475)

