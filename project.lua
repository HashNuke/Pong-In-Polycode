screen = Screen()

class "Player" (EventHandler)

function Player:Player(x, y, human_player)
    self.shape = ScreenShape(SHAPE_RECT, 10, 100)
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(x,y)
    screen:addChild(self.shape)

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
                
                -- NOTES: screen measurement is from top(0) to down(n)
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
    self.shape:setPositionMode(POSITION_CENTER)
    self.shape:setPosition(320,240)
    screen:addChild(self.shape)
end

-- end of Ball class

human = Player(10, 50, true)
computer = Player(630, 50, false)
ball = Ball()
