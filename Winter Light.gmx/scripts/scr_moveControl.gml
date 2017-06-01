var moveT = (metre*movement*moveMult)/global.frameRate

moveT = moveT/dTerrain

if sprinting = true and (leftKey-rightKey != 0 or upKey-downKey != 0)
{
    spDelay = .5
    moveT *= 1.7
    sp -= 1.5/global.frameRate
}

if canMove = true and grounded = true
{
    //Horizontal Movement
    if leftKey-rightKey = 1
    {
        hspd = max(-moveT,hspd-(moveT*accel))
    }
    else if leftKey-rightKey = -1
    {
        hspd = min(moveT,hspd+(moveT*accel))
    }
    
    //Vertical Movement
    if upKey-downKey = 1
    {
        vspd = max(-moveT,vspd-(moveT*accel))
    }
    else if upKey-downKey = -1
    {
        vspd = min(moveT,vspd+(moveT*accel))
    }
    
    hspd = lengthdir_x(min(moveT,point_distance(0,0,hspd,vspd)),point_direction(0,0,hspd,vspd))
    vspd = lengthdir_y(min(moveT,point_distance(0,0,hspd,vspd)),point_direction(0,0,hspd,vspd))
}

