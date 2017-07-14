#define meleeCollider


#define meleeColliderInitialize
z = 0
collision = false

life = 0.08

#define meleeColliderDraw
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,c_white,1)

#define meleeColliderStep
life -= 1/global.frameRate

if life <= 0
{
    instance_destroy()
}

