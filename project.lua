screen = Screen()

class "Player" (EventHandler)

function Player:Player(x,y)
    self.shape = ScreenShape(SHAPE_RECT, 10, 100)
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(x,y)
    screen:addChild(self.shape)
end

-- end of player class

class "Ball" (EventHandler)

function Ball:Ball()
    self.shape = ScreenShape(SHAPE_CIRCLE, 10, 10)
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(320,240)
    screen:addChild(self.shape)
end

-- end of Ball class

human = Player(10,50)
computer = Player(630,50)
ball = Ball()
