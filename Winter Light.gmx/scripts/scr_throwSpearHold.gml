//Spear Hold Script
animStep[1] += 1

switch(argument0)
{
case 0:
itemDist = 12
itemDir = (round(facing/15)*15)+(45*meleeSwing)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*.1/invSlot[invSelect].throwRate
break

case 1:
itemDist = 8
itemDir = (round(facing/15)*15)+(90*meleeSwing)
itemHeight = hipsHeight+4-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*.7/invSlot[invSelect].throwRate
meleeCharge = 1
break

case 2:
itemDist = 12
itemDir = (round(facing/15)*15)+(135*meleeSwing)
itemHeight = hipsHeight+5-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*.2/invSlot[invSelect].throwRate
scr_sheen()
meleeCharge = 2
sweetSpot = true
break

case 3:
itemDist = 12
itemDir = (round(facing/15)*15)+(135*meleeSwing)
itemHeight = hipsHeight+5-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*1/invSlot[invSelect].throwRate
sweetSpot = false
break

case 4:
anim[1] = invSlot[invSelect].anim[0]
animStep[1] = 0
canAttack = true
meleeCharge = 0
hold = 0
sweetSpot = 0
moveMult = 1
alarm[1] = 1
break
}
