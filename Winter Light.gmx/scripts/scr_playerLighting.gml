/*Disabled for testing
if instance_exists(fid)
{
global.x = fid.x
global.y = fid.y+(fid.w/2)
}
else
{
global.x = x
global.y = y
}

with(obj_floor)
{
losVis = false
    if point_distance(x,y+(w/2),global.x,global.y) < sightRange*metre
    {   
        if !collision_line(x,y+(w/2),global.x,global.y,obj_terrain,false,true)
        {
            losVis = true
        }
    }
}
