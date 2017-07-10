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

case 2:
return humanoidWalk
break

case 3:
return humanoidIdle
break

case 4:
return humanoidDodge
break

}

#define humanoidInitialize
//Establish Humanoid variables

//Surface Details
charSurfSize = 28
charSurf = surface_create(charSurfSize,charSurfSize)

//Gender
gender = 0

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

shldrXAdjust[1] = 1
shldrYAdjust[1] = 1
shldrXAdjust[2] = 2
shldrYAdjust[2] = 1

handDist[1] = 4
handDir[1] = 0
handHeight[1] = 2
itemRot[1] = 0
itemSprite[1] = spr_sword
handDist[2] = 4
handDir[2] = 0
handHeight[2] = 2
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
    
    bodyX = hipsX+lengthdir_x(bodyYAdjust, hipsRot+90)+lengthdir_x(bodyXAdjust*bodyHFacing, hipsRot)
    bodyY = hipsY+lengthdir_y(bodyYAdjust, hipsRot+90)+lengthdir_y(bodyXAdjust*bodyHFacing, hipsRot)
    
    chstX = bodyX+lengthdir_x(chstYAdjust+bounce, bodyRot+90)+lengthdir_x(chstXAdjust*bodyHFacing, bodyRot)
    chstY = bodyY+lengthdir_y(chstYAdjust+bounce, bodyRot+90)+lengthdir_y(chstXAdjust*bodyHFacing, bodyRot)
    
    headX = bodyX+lengthdir_x(headYAdjust, bodyRot+90)+lengthdir_x(headXAdjust*bodyHFacing, bodyRot)
    headY = bodyY+lengthdir_y(headYAdjust, bodyRot+90)+lengthdir_y(headXAdjust*bodyHFacing, bodyRot)
    
    shldrX[1] = bodyX+lengthdir_x(shldrYAdjust[1], bodyRot+90)+lengthdir_x(shldrXAdjust[1]*bodyHFacing, bodyRot)
    shldrY[1] = bodyY+lengthdir_y(shldrYAdjust[1], bodyRot+90)+lengthdir_y(shldrXAdjust[1]*bodyHFacing, bodyRot)
    
    shldrX[2] = bodyX+lengthdir_x(shldrYAdjust[2], bodyRot+90)+lengthdir_x(shldrXAdjust[2]*bodyHFacing, bodyRot+180)
    shldrY[2] = bodyY+lengthdir_y(shldrYAdjust[2], bodyRot+90)+lengthdir_y(shldrXAdjust[2]*bodyHFacing, bodyRot+180)
    
    handX[1] = round(bodyX+lengthdir_x(handDist[1], handDir[1]))
    handY[1] = round(bodyY+lengthdir_y(handDist[1], handDir[1]))-handHeight[1]
    
    handX[2] = round(bodyX+lengthdir_x(handDist[2], handDir[2]))
    handY[2] = round(bodyY+lengthdir_y(handDist[2], handDir[2]))-handHeight[2]    
    
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
    armStretch[1] = max(floor(point_distance(handX[1],handY[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap])),armSpriteLength+1)/(armSpriteLength+1)
    armLength[2] = min(floor(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap])),armSpriteLength)
    armStretch[2] = max(floor(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap])),armSpriteLength+1)/(armSpriteLength+1)
    
    //Hips and Legs
    draw_sprite_ext(hipsSprite,hipsImage+hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,c_white,1)
    
    //Body
    if bodyVFacing = 1{
    draw_sprite_ext(chstSprite,gender,chstX,chstY,bodyHFacing,1,bodyRot,c_white,1)}
    draw_sprite_ext(bodySprite,bodyImage+bodyVFacing,bodyX,bodyY,bodyHFacing,1,bodyRot,c_white,1)
    if bodyVFacing = 0{
    draw_sprite_ext(chstSprite,chstImage+bodyVFacing,chstX,chstY,bodyHFacing,1,bodyRot,c_white,1)}
    
    //Right Arm
    draw_sprite_ext(armSprite,armLength[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap],armStretch[1],bodyHFacing,handPoint[1],c_white,1)
    
    //Left Arm
    draw_sprite_ext(armSprite,armLength[2]+armSpriteLength+1,shldrX[2-shldrSwap],shldrY[2-shldrSwap],armStretch[2],bodyHFacing,handPoint[2],c_white,1)
    
    //Head
    draw_sprite_ext(headSprite,headImage+vFacing,headX,headY,hFacing,1,headRot,c_white,1)
    
    //draw_set_colour(c_red)
    //draw_point(shldrX[1+shldrSwap],shldrY[1+shldrSwap])
    //draw_set_colour(c_green)
    //draw_point(shldrX[2-shldrSwap],shldrY[2-shldrSwap])
    
    surface_reset_target()
}
else
{
    charSurf = surface_create(charSurfSize,charSurfSize)
}

#define humanoidWalk
animDelay[argument1] = .5
animSpeed[argument1] = max(abs(moving),1)

switch(argument0)
{
    case 0:
    hipsImage = 4
    humanoidWalk(3,argument1)
    animStep[argument1] = 4
    break
    
    case 1:
    hipsImage = 6
    bounce = 0
    break
    
    case 2:
    hipsImage = 4
    bounce = 1
    break
    
    case 3:
    hipsImage = 2
    bounce = 0
    break
    
    case 4:
    hipsImage = 6
    humanoidWalk(1,argument1)
    animStep[argument1] = 0
    break
}

#define humanoidIdle
animDelay[argument1] = .3
animSpeed[argument1] = 1
hipsImage = 2-(gender*2)

switch(argument0)
{
    case 0:
    
    break
    
    case 1:
    bounce = 1
    break
    
    case 2:
    bounce = 0
    break
    
    case 3:
    humanoidWalk(0,argument1)
    animStep[argument1] = 0
    break
}
#define humanoidDodge
animDelay[argument1] = .5
animSpeed[argument1] = max(abs(moving),1)

switch(argument0)
{
    case 0:
    hipsImage = 4
    humanoidWalk(3,argument1)
    animStep[argument1] = 4
    break
    
    case 1:
    hipsImage = 6
    hipsRot = 90
    bounce = 0
    break
    
    case 2:
    hipsImage = 4
    hipsRot = 180
    bounce = 1
    break
    
    case 3:
    hipsImage = 2
    hipsRot = 270
    bounce = 0
    break
    
    case 4:
    hipsImage = 6
    humanoidWalk(1,argument1)
    animStep[argument1] = 0
    break
}