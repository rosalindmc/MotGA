switch(argument0)
{
case 0:     //Object Initialize
itemType = item_spear
name = "Spear"
sprite_index = spr_spear

use[1] = scr_melee
use[2] = scr_melee

meleeRate = .8
meleeDmg = 3
meleeType = 'piercing'
meleeCost = 2
meleeLunge = 4
throwRate = .75
throwSpeed = 60
throwType = 'piercing'
throwDmg = 8
aiMinRange = 2
aiMaxRange = 3

centerAdj = 10
length = 30

anim[0] = scr_swordIdle
anim[1] = scr_spearStab
anim[2] = scr_spearStab
anim[3] = scr_spearStab
anim[4] = scr_spearHold
anim[5] = scr_throwSpearHold
break

case 1:

break

}
