#define humanoid
//Humanoid Control Script
switch(argument0)
{
case 0:     //Initialize Humanoid
humanoidInitialize()
break

case 1:     //Draw Humanoid
humanoidDraw()
break
}

#define humanoidInitialize
//Establish Humanoid variables

//Surface Details
charSurfSize = 28
charSurf = surface_create(charSurfSize,charSurfSize)

//Bone Information
bounce = 0

hipsImage = 0
hipsSprite = spr_humanoidLegs
hipsRot = 0
hipsVFacing = 0
hipsHFacing = 1

bodyImage = 0
bodySprite = spr_humanoidBody
bodyXAdjust = 0
bodyYAdjust = 8
bodyRot = 0
bodyVFacing = 0
bodyHFacing = 1

chstImage = 0
chstSprite = spr_humanoidChest
chstXAdjust = 1
chstYAdjust = -1

shldrXAdjust[1] = 2
shldrYAdjust[1] = 2
shldrXAdjust[2] = 2
shldrYAdjust[2] = 2

handDist[1] = 0
handDir[1] =  0
handDist[2] = 0
handDir[2] =  0

armSprite = spr_humanoidArms
armLength = 5

headImage = 0
headSprite = spr_humanoidHead
headXAdjust = 0
headYAdjust = 4
headRot = 0

#define humanoidDraw
//Establish bone information
var hipsX, hipsY, bodyX, bodyY, chstX, chstY

//Draw All Details to Char Surface
if surface_exists(charSurf)  
{        
    surface_set_target(charSurf)
    draw_clear_alpha(c_white,0)
    
    //Bone Locations
    hipsX = round(charSurfSize*.5)
    hipsY = round(charSurfSize*.75)
    
    bodyX = round(hipsX+lengthdir_x(bodyYAdjust, hipsRot+90)+lengthdir_x(bodyXAdjust*bodyHFacing, hipsRot))
    bodyY = round(hipsY+lengthdir_y(bodyYAdjust, hipsRot+90)+lengthdir_y(bodyXAdjust*bodyHFacing, hipsRot))
    
    chstX = round(bodyX+lengthdir_x(chstYAdjust, bodyRot+90)+lengthdir_x(chstXAdjust*bodyHFacing, bodyRot))
    chstY = round(bodyY+lengthdir_y(chstYAdjust, bodyRot+90)+lengthdir_y(chstXAdjust*bodyHFacing, bodyRot))
    
    headX = round(bodyX+lengthdir_x(headYAdjust, bodyRot+90)+lengthdir_x(headXAdjust*bodyHFacing, bodyRot))
    headY = round(bodyY+lengthdir_y(headYAdjust, bodyRot+90)+lengthdir_y(headXAdjust*bodyHFacing, bodyRot))
    
    shldrX[1] = round(bodyX+lengthdir_x(shldrYAdjust[1], bodyRot+90)+lengthdir_x(shldrXAdjust[1]*bodyHFacing, bodyRot))
    shldrY[1] = round(bodyY+lengthdir_y(shldrYAdjust[1], bodyRot+90)+lengthdir_y(shldrXAdjust[1]*bodyHFacing, bodyRot))
    
    shldrX[2] = round(bodyX+lengthdir_x(shldrYAdjust[2], bodyRot+90)+lengthdir_x(shldrXAdjust[2]*-bodyHFacing, bodyRot))
    shldrY[2] = round(bodyY+lengthdir_y(shldrYAdjust[2], bodyRot+90)+lengthdir_y(shldrXAdjust[2]*-bodyHFacing, bodyRot))
    
    handX[1] = round(hipsX+lengthdir_x(handDist[1], handDir[1]))
    handY[1] = round(hipsY+lengthdir_y(handDist[1], handDir[1]))
    
    handX[2] = round(hipsX+lengthdir_x(handDist[2], handDir[2]))
    handY[2] = round(hipsY+lengthdir_y(handDist[2], handDir[2]))
  
    draw_sprite_ext(hipsSprite,hipsImage,hipsX,hipsY,hipsHFacing,1,hipsRot,c_white,1)
    draw_sprite_ext(bodySprite,bodyImage,bodyX,bodyY,bodyHFacing,1,bodyRot,c_white,1)
    draw_sprite_ext(chstSprite,chstImage,chstX,chstY,bodyHFacing,1,bodyRot,c_white,1)
    draw_sprite_ext(headSprite,headImage,headX,headY,bodyHFacing,1,headRot,c_white,1)
    
    //draw_rectangle(10,10,20,20,true)
    surface_reset_target()
}
else
{
    charSurf = surface_create(charSurfSize,charSurfSize)
}
