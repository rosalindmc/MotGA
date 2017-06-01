global.ix = targetX
global.iy = targetY-h
global.i = 10
global.id = -4
    with(obj_char)
    {
        if distance_to_point(global.ix,global.iy) < global.i
        {
            global.id = id
            global.i = distance_to_point(global.ix,global.iy)
        }
    }
if instance_exists(global.id)
{
    targetH = global.id.h
}
else
{
    targetH = h
}
