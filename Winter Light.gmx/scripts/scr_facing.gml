//Facing
if canMove = true
{
    if canAttack = true
    {
        facing = scr_rotate(facing,point_direction(x,y,targetX,targetY),(180*turnSpeed)/global.frameRate)
    }
    else
    {
        facing = scr_rotate(facing,point_direction(x,y,targetX,targetY),(60*turnSpeed)/global.frameRate)
    }
}

if scr_rotate(facing,270,90) = 270
{
facingV = 0
}
else
{
facingV = 1
}

if scr_rotate(facing,180,90) = 180
{
facingH = -1
}
else
{
facingH = 1
}
