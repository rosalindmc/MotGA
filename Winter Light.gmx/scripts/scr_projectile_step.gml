//Contact
if collision_line(x,y,x+lengthdir_x(spd,direction),y+lengthdir_y(spd,direction),obj_hitBlock,true,true)
{
    while !collision_line(x,y,x+lengthdir_x(1,direction),y+lengthdir_y(1,direction),obj_hitBlock,true,true)
    {
    x += lengthdir_x(1,direction)
    y += lengthdir_y(1,direction)
    }
    x += lengthdir_x(1,direction)
    y += lengthdir_y(1,direction)
    spd = 0
}
else
{
//Flight
x += lengthdir_x(spd,direction)
y += lengthdir_y(spd,direction)
}

//Projectile Step
h += zspd
