#define particle

#define particleInitialize
z = 0
zspd = 0
hspd = 0
vspd = 0

spin = 0
floorZ = 0

animSpeed = 10
animDelay = 1

onDeath = -4
splatDecal = spr_none

life = .50

image_angle = 0
image_speed = 0



#define particleStep
image_angle += spin/global.frameRate
moveStepParticle()
isoDepth(-5)

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
draw_sprite_ext(sprite_index,image_index,x,y-z,1,1,image_angle,c,image_alpha)

#define particleDestroy
