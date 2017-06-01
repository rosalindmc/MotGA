if instance_exists(owner)
{
f = round(owner.facing/15)*15
    if slot = owner.invSelect
    {
    inHand = true
    x = round(owner.x+lengthdir_x(owner.itemDist,owner.itemDir))
    y = round(owner.y+lengthdir_y(owner.itemDist,owner.itemDir))
    image_angle = owner.itemRot
    image_yscale = owner.facingH
    image_index = 0
    facing = owner.facing
    h = owner.h+owner.itemHeight
    }
    else
    {
    inHand = false
    x = round(( ( (owner.x+(lengthdir_x (1,f+ (15* (slot+8) ) ) ) ) *3) +x)/4)
    y = round(( ( (owner.y+(lengthdir_y (1,f+ (15* (slot+8) ) ) ) ) *3) +y)/4)
    image_angle = 270+owner.hipsRot+(owner.facingH*(-45+(-5*slot)+abs(angle_difference(270,owner.facing)*.25)))
    image_yscale = owner.facingH
    image_index = 1
    h = (owner.y-owner.bodyY)+owner.hipsBounce
    }
}
else
{
scr_dropItem()
}
