require('entities/Wall')
require('entities/Player')
require('entities/Ball')

screen = PhysicsScreen(1, 60)   -- used as global in classes, so has to be declared before others

human = Player(15, 480/2, true)
computer = Player(625, 480/2, false)
ball = Ball(640/2, 480/2)

leftWall = Wall(10, 480, 5, 480/2)
rightWall = Wall(10, 480, 635, 480/2)
topWall = Wall(640, 10, 640/2, 5)
bottomWall = Wall(640, 10, 640/2, 475)

screen:applyImpulse(ball.shape, 100, 0)
