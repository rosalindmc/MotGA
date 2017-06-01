#define scr_melee
//REMINDER: This script is run by the weapon

with(owner)
{
    switch(argument0)
    {   
    case 1:     //Pressed
    if ((canAttack = true and canAct = true and hold = 0) or (sweetSpot = true and fumble = false)) and sp >= invSlot[invSelect].meleeCost/(1+sweetSpot)
    {
        //Begin Hold
        meleeCharge = 1
        fumble = false
        hold = 1
        
        anim[1] = invSlot[invSelect].anim[4]
        animStep[1] = 0
        alarm[0] = 1
        moveMult = 1 - invSlot[invSelect].meleeSlow
        
        if sweetSpot = true
        {
            meleeSwing *= -1
        }
    }
    else
    {
        fumble = true
    }
    break
    
    case 2:     //Released
    if meleeCharge != 0 and (canAttack = true or (sweetSpot = true and fumble = false))
    {
        if point_distance(x,y,targetX,targetY) < 30 or (arrows = 0 and invSlot[invSelect].bow = true)
        {
            scr_meleeSwing(2)
        }
        else
        {
            scr_meleeSwing(1)
        }            
    }
    break
    }
}

#define scr_meleeEnd
//Finnish Attack Animation
if instance_exists(invSlot[invSelect])
{
    anim[1] = invSlot[invSelect].anim[0]
}
animStep[1] = 0
canAttack = true
meleeCharge = 0
spDelay = 0
moveMult = 1

#define scr_meleeHit
//Make Melee Collider
if strike = 1
{
    strike = 0
    with(invSlot[invSelect])
    {
    i = instance_create(owner.x+lengthdir_x(length+owner.itemDist,owner.facing),owner.y+lengthdir_y(length+owner.itemDist,owner.facing),obj_meleeHit)
    i.owner = owner
    i.image_angle = owner.facing
    i.dmg = meleeDmg*owner.meleeCharge
    i.impact = meleeImpact*owner.meleeCharge
    i.h = h
    i.dmgType = owner.meleeType
    i.sprite_index = owner.attackMask
    i.image_yscale = meleeSize*owner.meleeSwing
    i.image_xscale = meleeSize
    }
}

#define scr_meleeSwing
anim[1] = invSlot[invSelect].anim[argument0]
animStep[1] = 0
alarm[1] = 1

spDelay = 10
sp -= (invSlot[invSelect].meleeCost*meleeCharge)/(1+sweetSpot)
canAttack = false
sweetSpot = false
strike = 1
hold = 0

alarm[0] = 1

if invSlot[invSelect].bow = false
{
if meleeCharge = 2
{
anim[0] = scr_humanoidFlinchForward
animStep[0] = 0 
}
else
{
anim[0] = scr_humanoidWalk
animStep[0] = 3
}

canMove = false
alarm[2] = .1*global.frameRate
hspd += lengthdir_x(metre*(5+(meleeCharge*invSlot[invSelect].meleeLunge))/global.frameRate,facing)
vspd += lengthdir_y(metre*(5+(meleeCharge*invSlot[invSelect].meleeLunge))/global.frameRate,facing)
}

#define scr_sheen
if pc = true
{
with(invSlot[invSelect])
{
    //Create a Sheen
    instance_create(x+lengthdir_x(length,image_angle),y-h+lengthdir_y(length,image_angle),obj_sheen)
    audio_play_sound(snd_sheen,0,false)
}
}