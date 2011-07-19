screen = Screen()

class "Player" (EventHandler)

function Player:Player(x,y)
    self.shape = ScreenShape(SHAPE_RECT, 10, 100)
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(x,y)
    screen:addChild(self.shape)
end

human = Player(10,50)
computer = Player(630,50)
