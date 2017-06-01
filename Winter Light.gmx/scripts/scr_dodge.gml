if canMove = true
{
    if sp >= dodgeCost
    {
    if hspd != 0 or vspd != 0
    {
    facing = point_direction(0,0,hspd,vspd)
    
    alarm[0] = 1
    anim[0] = scr_dodgeRoll
    animStep[0] = 0 
    canMove = false
    alarm[2] = .55*global.frameRate

    hspd = lengthdir_x(metre*dodgeSpeed/global.frameRate,facing)
    vspd = lengthdir_y(metre*dodgeSpeed/global.frameRate,facing)
    
    sp -= dodgeCost
    spDelay = 1.1
    }
    }
}
