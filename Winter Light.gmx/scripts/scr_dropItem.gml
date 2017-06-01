#define scr_dropItem
if instance_exists(owner)
{
    owner.invSlot[slot] = -4
}

i = instance_create(x,y,obj_item)
i.h = h
i.itemType = itemType
i.image_angle = image_angle
i.iSpin = choose(-1,1)*random(180/global.frameRate)
i.spd = point_distance(xprevious,yprevious,x,y)
i.direction = point_direction(xprevious,yprevious,x,y)

instance_destroy()

#define scr_throw
anim[1] = scr_throwAnim
animStep[1] = 0
alarm[1] = 1

spDelay = 10
sp -= (invSlot[invSelect].throwCost*meleeCharge)/(1+sweetSpot)
canAttack = false
sweetSpot = false
hold = 0





#define scr_throwing
with(owner)
{
    switch(argument0)
    {
    case 1:
    if canAttack = true and canAct = true and hold = 0
    {
        hold = 1
        
        anim[1] = invSlot[invSelect].anim[5]
        animStep[1] = 0
        alarm[0] = 1
        moveMult = 1 - invSlot[invSelect].meleeSlow
    }
    break
    
    case 2:
    if canAttack = true and canAct = true
    {
        if meleeCharge != 0
        {
            scr_throw()
        }
        else
        {
            with(invSlot[invSelect])
            {
                scr_dropItem()
            }
            anim[1] = scr_swordIdle
            animStep[1] = 0
            canAttack = true
            meleeCharge = 0
            hold = 0
            sweetSpot = 0
            moveMult = 1
        }
    }
    break
    }
}

#define scr_throwProj
with(invSlot[invSelect])
{
if instance_exists(owner)
{
    owner.invSlot[slot] = -4
}

i = instance_create(x,y,obj_item)
i.h = h
i.itemType = itemType

i.dmg = throwDmg*owner.meleeCharge
i.impact = throwImpact*owner.meleeCharge
i.attacker = owner

i.image_angle = owner.facing
i.iSpin = throwSpin/global.frameRate
i.spd = throwSpd*metre/global.frameRate
i.direction = point_direction(owner.x,owner.y,owner.targetX,owner.targetY)
i.harm = true
i.dmgType = throwType

instance_destroy()
}

spDelay = .1