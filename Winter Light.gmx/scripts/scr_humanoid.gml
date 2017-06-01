switch(argument0)
{
case 0:  //Initialize Variables
animType = scr_humanoid

anim[0] = scr_humanoidWalk
animStep[0] = 0
anim[1] = scr_swordIdle
animStep[1] = 0

alarm[0] = 10
alarm[1] = 10

hipsHeight = 16      //16 standing
hipsBounce = 0      
hipsImage = 0       //0 stand, 2 bounce, 4 run, 6 run, 8 dodge forward, 10 dodge back
hipsRot = 0
hipsX = 0
hipsY = 0
bodyHeight = 5    
bodyBounce = 0       //head adjust
bodyImage = 12       //12/13 normal,14/15 bounce 
bodyRot = 0
bodyX = 0
bodyY = 0    
headImage = 16      //16 normal, 17 bounce 
headRot = 0
hairImage = 18      //18 normal, 19 bounce 
hairRot = 0
headX = 0
headY = 0
flinch = 1
xAdj = 0
yAdj = 0

charSprite = spr_princess
blood = obj_blood
canBleed = true

break

case 1:  //Draw
hipsX = round(x+xAdj)
hipsY = round(y-h-yAdj)

bodyX = round(hipsX+lengthdir_x(hipsHeight-hipsBounce,hipsRot+90))
bodyY = round(hipsY+lengthdir_y(hipsHeight-hipsBounce,hipsRot+90))

headX = round(bodyX+lengthdir_x(bodyHeight,bodyRot+90))
headY = round(bodyY+lengthdir_y(bodyHeight,bodyRot+90))

if facingV = 0
{
    draw_sprite_ext(charSprite,hairImage+2,round(headX),round(headY),facingH,1,hairRot,c_white,1)
}

draw_sprite_ext(charSprite,hipsImage+facingV,round(hipsX),round(hipsY),facingH,1,hipsRot,c_white,1)
draw_sprite_ext(charSprite,bodyImage+facingV,round(bodyX),round(bodyY),facingH,1,bodyRot,c_white,1)
draw_sprite_ext(charSprite,headImage+(facingV*2),round(headX),round(headY),facingH*flinch,1,headRot,c_white,1)

if facingV = 1
{
    draw_sprite_ext(charSprite,hairImage+2,round(headX),round(headY),facingH,1,hairRot,c_white,1)
}

break
}
