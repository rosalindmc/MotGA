#define meleeCollider


#define meleeColliderInitialize
z = 0
collision = false

life = 0.15
image_speed = 0
animDelay = 0.05

#define meleeColliderDraw
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,c_white,1)
draw_text(x,y,z)

#define meleeColliderStep
animDelay -= 1/global.frameRate
if animDelay <= 0
{
    animDelay += 0.05
    image_index = min(image_index+1,2)
}

life -= 1/global.frameRate

if life <= 0
{
    instance_destroy()
}
