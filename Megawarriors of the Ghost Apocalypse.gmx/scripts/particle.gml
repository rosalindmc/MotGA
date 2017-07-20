#define particle

#define particleInitialize
z = 0
life = .50
image_speed = 0

animSpeed = 10
animDelay = 1

//temp
sprite_index = spr_sheen

#define particleStep
animDelay -= animSpeed/global.frameRate

if animDelay <= 0
{
    animDelay += 1
    image_index += 1
}

life -= 1/global.frameRate

if life <= 0
{
    instance_destroy()
}

#define particleDraw
draw_sprite(sprite_index,image_index,x,y-z)
#define particleDestroy

