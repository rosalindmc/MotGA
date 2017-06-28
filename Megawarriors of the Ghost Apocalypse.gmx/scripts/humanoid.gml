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
handDir[1] = 0
handHeight[1] = 0
itemRot[1] = 0
itemSprite[1] = spr_sword
handDist[2] = 0
handDir[2] = 0
handHeight[2] = 0
itemRot[2] = 0
itemSprite[2] = spr_sword

armSprite = spr_humanoidArms
armSpriteLength = 5

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
        
    //Body Facing and Direction
    twist(bodyTwist)
    
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
    handY[1] = round(hipsY+lengthdir_y(handDist[1], handDir[1]))-handHeight[1]
    
    handX[2] = round(hipsX+lengthdir_x(handDist[2], handDir[2]))
    handY[2] = round(hipsY+lengthdir_y(handDist[2], handDir[2]))-handHeight[2]    
    
    //Hand Shenanigans
    //If using a great weapon, move second hand
    if greatWeapon = true
    {
        handX[2] = round(handX[1]+lengthdir_x(greatWeaponSize*((shldrSwap*2)-1), (itemRot[1])))
        handY[2] = round(handY[1]+lengthdir_y(greatWeaponSize*((shldrSwap*2)-1), (itemRot[1])))
        
        handX[1] = round(handX[1]+lengthdir_x(greatWeaponSize*-1*((shldrSwap*2)-1), (itemRot[1])))
        handY[1] = round(handY[1]+lengthdir_y(greatWeaponSize*-1*((shldrSwap*2)-1), (itemRot[1])))
    }
    
    //Arm Directions
    handPoint[1] = point_direction(shldrX[1+shldrSwap],shldrY[1+shldrSwap],handX[1],handY[1])
    handPoint[2] = point_direction(shldrX[2-shldrSwap],shldrY[2-shldrSwap],handX[2],handY[2])
    armLength[1] = min(floor(point_distance(handX[1],handY[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap])),armSpriteLength)
    armStretch[1] = max(floor(point_distance(handX[1],handY[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap])),armSpriteLength)/armSpriteLength
    armLength[2] = min(floor(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap])),armSpriteLength)
    armStretch[2] = max(floor(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap])),armSpriteLength)/armSpriteLength
    
    //Hips and Legs
    draw_sprite_ext(hipsSprite,hipsImage+hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,c_white,1)
    
    //Body
    if bodyVFacing = 1{
    draw_sprite_ext(chstSprite,chstImage+bodyVFacing,chstX,chstY,bodyHFacing,1,bodyRot,c_white,1)}
    draw_sprite_ext(bodySprite,bodyImage+bodyVFacing,bodyX,bodyY,bodyHFacing,1,bodyRot,c_white,1)
    if bodyVFacing = 0{
    draw_sprite_ext(chstSprite,chstImage+bodyVFacing,chstX,chstY,bodyHFacing,1,bodyRot,c_white,1)}
    
    //Right Arm
    draw_sprite_ext(armSprite,armLength[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap],armStretch[1],bodyHFacing,handPoint[1],c_red,1)
    
    //Left Arm
    draw_sprite_ext(armSprite,armLength[2]+armSpriteLength+1,shldrX[2-shldrSwap],shldrY[2-shldrSwap],armStretch[2],bodyHFacing,handPoint[2],c_green,1)
    
    //Head
    draw_sprite_ext(headSprite,headImage+vFacing,headX,headY,hFacing,1,headRot,c_white,1)
    
    draw_arrow(hipsX,hipsY,hipsX+lengthdir_x(handDist[1], handDir[1]),hipsY+lengthdir_y(handDist[1], handDir[1]),3)
    draw_arrow(hipsX,hipsY,hipsX+lengthdir_x(handDist[2], handDir[2]),hipsY+lengthdir_y(handDist[2], handDir[2]),3)
    
    //draw_rectangle(10,10,20,20,true)
    surface_reset_target()
}
else
{
    charSurf = surface_create(charSurfSize,charSurfSize)
}