if collision_point(x,y,obj_grid,false,false)
{
grid = collision_point(x,y,obj_grid,false,false)

if grid.vis = true
{
    switch(argument0)
    {
        case 0: //Ground
        draw_sprite_ext(sprite_index,bow,round(x-lengthdir_x(centerAdj,image_angle)),round(y-lengthdir_y(centerAdj,image_angle)-h),1,image_yscale,image_angle,c_white,1)
        break
        
        case 1: //Held
        if instance_exists(owner)
        {
            if owner.canAttack = false and inHand = true
            {
            draw_sprite_ext(sprite_index,owner.itemImage,round(x+lengthdir_x(itemHilt,image_angle)),round(y+lengthdir_y(itemHilt,image_angle)-h),1,owner.meleeSwing,image_angle,c_white,1)
            }
            else if inHand = true
            {
            draw_sprite_ext(sprite_index,owner.itemImage,round(x+lengthdir_x(itemHilt,image_angle)),round(y+lengthdir_y(itemHilt,image_angle)-h),1,image_yscale,image_angle,c_white,1)
            }
            else
            {
            draw_sprite_ext(sprite_index,1,round(x+lengthdir_x(itemHilt,image_angle)),round(y+lengthdir_y(itemHilt,image_angle)-h),1,image_yscale,image_angle,c_white,1)
            }
            break
        }
    }
}
}
else
{
instance_destroy()
}
