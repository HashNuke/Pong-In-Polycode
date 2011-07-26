module(..., package.seeall);

class "Player" (EventHandler)

function Player:Player(x, y, human_player)
    self.shape = ScreenShape(SHAPE_RECT, 10, 100)
    self.shape:setPosition(x,y)
    screen:addCollisionChild(self.shape, ENTITY_RECT)

    if human_player == true then
        self:EventHandler()     -- register event handler
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
                self.shape:setPosition(pos.x, pos.y-25)     --NOTES: measure top/left(0) to down/right(n)
            elseif key == KEY_DOWN then
                local pos = self.shape:getPosition()
                self.shape:setPosition(pos.x, pos.y+25)
            end
        end
    end
end

