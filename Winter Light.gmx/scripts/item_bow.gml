switch(argument0)
{
case 0:     //Object Initialize
itemType = item_bow
name = "Hunting Bow"
sprite_index = spr_bow

use[1] = scr_melee
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
aiMaxRange = 20
bow = true

projectile = obj_arrow
bulletType = 'piercing'
bulletSpd = 50
bulletDmg = 3
bulletImpact = 10
bulletStr = true
fireRate = .7
muzzleFlash = -4
bLength = 2


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
