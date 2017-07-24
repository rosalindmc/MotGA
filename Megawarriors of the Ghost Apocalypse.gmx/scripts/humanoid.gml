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
return humanoidShortDodge
break

case 5:
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

//Appearance Info
clothingSprite = spr_cBarbarian
skirtSprite = spr_sBarbarian
hairSprite = spr_longHair
hairColour = hairBlack
skinTone = choose(skinTan,skinDark,skinBrown,skinPink,skinPale,skinFireRed,skinBurntRed,skinAshRed)

//Anim
legLength = 4
bounce = 0
bounceTimer = 0
flow = 0        //0 basic, 1 bounce, 2 flow left, 3 flow right
flowTimer = 0
hairRot = 0

//Bone Information

hipsImage = 0
hipsSprite = spr_humanoidLegs
hipsRot = 0
hipsVFacing = 0
hipsHFacing = 1

bodyImage = 0
bodySprite = spr_humanoidBody
bodyXAdjust = 0
bodyYAdjust = 4
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
handDistDest[1] = 4
handDir[1] = 0
handDirDest[1] = 0
handHeight[1] = 2
handHeightdest[1] = 2

itemRot[1] = 0
itemRotDest[1] = 0
itemSprite[1] = spr_sword

handDist[2] = 4
handDistDest[2] = 4
handDir[2] = 0
handDirDest[2] = 0
handHeight[2] = 2
handHeightDest[2] = 2
itemRot[2] = 0
itemRotDest[2] = 0
itemSprite[2] = spr_sword

armSprite = spr_humanoidArms
armSpriteLength = 5

headImage = 0
headSprite = spr_humanoidHead
headXAdjust = 0
headYAdjust = 4
headRot = 0

xAdj = 0
yAdj = 0

hipsX = 0
hipsY = 0

bodyX = 0
bodyY = 0

chstX = 0
chstY = 0

headX = 0
headY = 0

shldrX[1] = 0
shldrY[1] = 0

shldrX[2] = 0
shldrY[2] = 0

handX[1] = 0
handY[1] = 0
handX[2] = 0
handY[2] = 0

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
    hipsX = round(charSurfSize*.5)+lengthdir_x(legLength, hipsRot+90)+xAdj
    hipsY = round(charSurfSize*.75)+lengthdir_y(legLength, hipsRot+90)-yAdj
    
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
    
    handX[1] = round(bodyX+lengthdir_x(handDist[1], (round(facing/15)*15)+handDir[1]))
    handY[1] = round(bodyY+lengthdir_y(handDist[1], (round(facing/15)*15)+handDir[1]))-handHeight[1]
    
    handX[2] = round(bodyX+lengthdir_x(handDist[2], (round(facing/15)*15)+handDir[2]))
    handY[2] = round(bodyY+lengthdir_y(handDist[2], (round(facing/15)*15)+handDir[2]))-handHeight[2]    
    
    //Hand Shenanigans
    //If using a great weapon, move second hand
    if greatWeapon = true
    {
        handX[2] = round(handX[1]+lengthdir_x(greatWeaponSize*((shldrSwap*2)-1), (round(facing/15)*15)+(itemRot[1])))
        handY[2] = round(handY[1]+lengthdir_y(greatWeaponSize*((shldrSwap*2)-1), (round(facing/15)*15)+(itemRot[1])))
        
        handX[1] = round(handX[1]+lengthdir_x(greatWeaponSize*-1*((shldrSwap*2)-1), (round(facing/15)*15)+(itemRot[1])))
        handY[1] = round(handY[1]+lengthdir_y(greatWeaponSize*-1*((shldrSwap*2)-1), (round(facing/15)*15)+(itemRot[1])))
    }
    
    //Arm Directions
    handPoint[1] = point_direction(shldrX[1+shldrSwap],shldrY[1+shldrSwap],handX[1],handY[1])
    handPoint[2] = point_direction(shldrX[2-shldrSwap],shldrY[2-shldrSwap],handX[2],handY[2])
    armLength[1] = min(floor(point_distance(handX[1],handY[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap])),armSpriteLength)
    armStretch[1] = max(floor(point_distance(handX[1],handY[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap])),armSpriteLength+1)/(armSpriteLength+1)
    armLength[2] = min(floor(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap])),armSpriteLength)
    armStretch[2] = max(floor(point_distance(handX[2],handY[2],shldrX[2-shldrSwap],shldrY[2-shldrSwap])),armSpriteLength+1)/(armSpriteLength+1)
    
    if vFacing = 0
    {
        draw_sprite_ext(hairSprite,4+bounce,headX,headY,hFacing,1,hairRot,hairColour,1)    
    }
    
    //Hips and Legs
    draw_sprite_ext(skirtSprite,(flow*2)+1-hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,c_white,1)
    draw_sprite_ext(hipsSprite,hipsImage+hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,skinTone,1)
    draw_sprite_ext(skirtSprite,(flow*2)+hipsVFacing,hipsX,hipsY,hipsHFacing,1,hipsRot,c_white,1)
    
    //Body
    if bodyVFacing = 1{
    draw_sprite_ext(chstSprite,gender,chstX,chstY,bodyHFacing,1,bodyRot,skinTone,1)}
    draw_sprite_ext(bodySprite,bodyImage+bodyVFacing,bodyX,bodyY,bodyHFacing,1,bodyRot,skinTone,1)
    if bodyVFacing = 0{
    draw_sprite_ext(chstSprite,chstImage+bodyVFacing,chstX,chstY,bodyHFacing,1,bodyRot,skinTone,1)}
    
    //Right Arm
    draw_sprite_ext(armSprite,armLength[1],shldrX[1+shldrSwap],shldrY[1+shldrSwap],armStretch[1],bodyHFacing,handPoint[1],skinTone,1)
    
    //Left Arm
    draw_sprite_ext(armSprite,armLength[2]+armSpriteLength+1,shldrX[2-shldrSwap],shldrY[2-shldrSwap],armStretch[2],bodyHFacing,handPoint[2],skinTone,1)
    
    //Head
    draw_sprite_ext(headSprite,headImage+vFacing,headX,headY,hFacing,1,headRot,skinTone,1)
    draw_sprite_ext(hairSprite,(bounce*2)+vFacing,headX,headY,hFacing,1,headRot,hairColour,1)
    if vFacing = 1
    {
        draw_sprite_ext(hairSprite,4+bounce,headX,headY,hFacing,1,hairRot,hairColour,1)    
    }
    
    surface_reset_target()
}
else
{
    charSurf = surface_create(charSurfSize,charSurfSize)
}

#define humanoidWalk
animDelay[argument1] = 2
animSpeed[argument1] = max(abs(moving),1)
xAdj = 0
yAdj = 0

hipsRot = 0
bodyRot = 0
hairRot = 0
headRot = 0
bodyTwist = 0

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
xAdj = 0
yAdj = 0

hipsRot = 0
bodyRot = 0
hairRot = 0
headRot = 0
bodyTwist = 0

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

#define humanoidShortDodge
animSpeed[argument1] = max(abs(moving),1)

switch(argument0)
{
    case 0:
    z += 4
    zspd += 2
    hipsImage = 2
    hairRot = -45*sign(hspd)
    
    animDelay[argument1] = .1
    break
    
    case 1:
    hipsImage = 4
    hipsRot = -30*sign(hspd)
    bodyRot = -30*sign(hspd)
    hairRot = -90*sign(hspd)
    headRot = 0
    
    animDelay[argument1] = .1
    break
    
    case 2:
    hipsImage = 10
    hipsRot = 0
    hairRot = -45*sign(hspd)
    animDelay[argument1] = .1
    
    //Hit Ground
    if player = true
    {
        obj_control.shake += 1
    }
    break
    
    case 3:
    animationReset(0)
    break
}

#define humanoidDodge
animSpeed[argument1] = max(abs(moving),1)

switch(argument0)
{
    case 0:
    z += 4
    zspd += 2
    hipsImage = 2
    hipsRot = -15*hFacing
    bodyRot = -30*hFacing
    hairRot = -45*hFacing
    animDelay[argument1] = .05
    break
    
    case 1:
    hipsImage = 6
    hipsRot = -90+facing
    bodyRot = -90+facing
    hairRot = -90+facing
    headRot = -90+facing
    
    xAdj = lengthdir_x(-5,facing)
    yAdj = 6
    
    animDelay[argument1] = .25
    break
    
    case 2:
    hipsImage = 10
    hipsRot = -150*hFacing
    bodyRot = -240*hFacing
    hairRot = -240*hFacing
    headRot = -270*hFacing
    animDelay[argument1] = .04
    
    xAdj = -3*hFacing
    yAdj = 10
    
    hspd = lengthdir_x(dodgeSpeed,facing)
    vspd = lengthdir_y(dodgeSpeed,facing)
    
    //Hit Ground
    if player = true
    {
        obj_control.shake += 2
    }
    break
    
    case 3:
    hipsImage = 10
    hipsRot = -180*hFacing
    bodyRot = -270*hFacing
    hairRot = -270*hFacing
    headRot = -300*hFacing
    
    xAdj = 0
    yAdj = 10
    
    animDelay[argument1] = .04
    break
    
    case 4:
    hipsImage = 10
    hipsRot = -210*hFacing
    bodyRot = -300*hFacing
    hairRot = -300*hFacing
    headRot = -330*hFacing
    
    xAdj = 3*hFacing
    yAdj = 9
    
    animDelay[argument1] = .04
    break
    
    case 5:
    hipsImage = 10
    hipsRot = -240*hFacing
    bodyRot = -330*hFacing
    hairRot = -330*hFacing
    headRot = 0
    
    xAdj = 7*hFacing
    yAdj = 6
    
    animDelay[argument1] = .04
    break
    
    case 6:
    hipsImage = 4
    hipsRot = -270*hFacing
    bodyRot = 0
    hairRot = -270*hFacing
    headRot = -30*hFacing
    
    xAdj = 8*hFacing
    yAdj = 3
    
    animDelay[argument1] = .04
    break
    
    case 7:
    hipsImage = 2
    hipsRot = 30*hFacing
    bodyRot = 0
    hairRot = -90*hFacing
    headRot = 0
    
    xAdj = 5*hFacing
    yAdj = 1
    
    animDelay[argument1] = .1
    break
    
    case 8:
    animationReset(0)
    break
}