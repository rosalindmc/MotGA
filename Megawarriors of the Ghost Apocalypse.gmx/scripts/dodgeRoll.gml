facing = argument0

//Replace with anim type check
animationStart(humanoid(4),0)
canMove = false
dodgeTimer = .6

hspd = lengthdir_x(dodgeSpeed,facing)
vspd = lengthdir_y(dodgeSpeed,facing)

stam -= dodgeCost
stamDelay = .6

