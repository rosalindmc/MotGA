//Horizontal Collision
if place_meeting(x+hspd,y,obj_solid) or collision_line(x,y,x+hspd,y,obj_solid,false,true)
{
    while !place_meeting(x+sign(hspd),y,obj_solid)
    {
        x += sign(hspd)
    }
    hspd = 0
}

x += hspd

//Vertical Collision
if place_meeting(x,y+vspd,obj_solid) or collision_line(x,y,x,y+vspd,obj_solid,false,true)
{
    while !place_meeting(x,y+sign(vspd),obj_solid)
    {
        y += sign(vspd)
    }
    vspd = 0
}

y += vspd
    
//Check Moving
if canMove = true and point_distance(x,y,xprevious,yprevious) > 0
{
    if abs(angle_difference(point_direction(x,y,targetX,targetY),point_direction(xprevious,yprevious,x,y))) < 90
    {
        moving = point_distance(x,y,xprevious,yprevious)
    }
    else
    {
        moving = -point_distance(x,y,xprevious,yprevious)
    }
}
else
{
    moving = false
}
