#define item_greenPot
switch(argument0)
{
case 0:     //Object Initialize
itemType = item_greenPot
name = "Green Potion"
itemClass = 'Potion'
sprite_index = spr_greenPot

use[1] = scr_stamina
use[2] = scr_melee

meleeRate = 1
meleeDmg = 1
meleeType = 'impact'
meleeCost = 2
meleeSize = 1
throwType = 'impact'
throwDmg = 1
throwSpd = 10
throwCost = 2
aiMinRange = 3
aiMaxRange = 200

centerAdj = 0
length = 1

anim[0] = scr_bowIdle
anim[1] = scr_bowShoot
anim[2] = scr_maceSmash
anim[3] = scr_swordSlash
anim[4] = scr_bowHold
break

case 1:

break

}

#define item_redPot
switch(argument0)
{
case 0:     //Object Initialize
itemType = item_redPot
name = "Red Potion"
itemClass = 'Potion'
sprite_index = spr_redPot

use[1] = scr_health
use[2] = scr_melee

meleeRate = 1
meleeDmg = 1
meleeType = 'impact'
meleeCost = 2
meleeSize = 1
throwType = 'impact'
throwDmg = 1
throwSpd = 10
throwCost = 2
aiMinRange = 3
aiMaxRange = 200

centerAdj = 0
length = 1

anim[0] = scr_bowIdle
anim[1] = scr_bowShoot
anim[2] = scr_maceSmash
anim[3] = scr_swordSlash
anim[4] = scr_bowHold
break

case 1:

break

}

#define item_bluePot
switch(argument0)
{
case 0:     //Object Initialize
itemType = item_bluePot
name = "Blue Potion"
itemClass = 'Potion'
sprite_index = spr_bluePot

use[1] = scr_speed
use[2] = scr_melee

meleeRate = 1
meleeDmg = 1
meleeType = 'impact'
meleeCost = 2
meleeSize = 1
throwType = 'impact'
throwDmg = 1
throwSpd = 10
throwCost = 2
aiMinRange = 3
aiMaxRange = 200

centerAdj = 0
length = 1

anim[0] = scr_bowIdle
anim[1] = scr_bowShoot
anim[2] = scr_maceSmash
anim[3] = scr_swordSlash
anim[4] = scr_bowHold
break

case 1:

break

}

#define scr_stamina
with(owner)
{
    spMax += 1
    sp += 1
    invSlot[invSelect] = -4
}

instance_destroy()

#define scr_health
with(owner)
{
    hpMax += 2
    hp += hpMax
    invSlot[invSelect] = -4
}

instance_destroy()

#define scr_speed
with(owner)
{
    i = instance_create(x,y,obj_speed)
    i.owner = id
    invSlot[invSelect] = -4
}

instance_destroy()