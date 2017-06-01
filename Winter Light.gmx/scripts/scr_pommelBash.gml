//Pommel Bash Script
animStep[1] += 1

switch(argument0)
{
case 0:
attackMask = spr_impact
meleeType = 'impact'
itemDist = 12
itemDir = (round(facing/15)*15)+(45*meleeSwing)
itemHeight = hipsHeight+5-hipsBounce
itemRot = (round(facing/15)*15)+(60*meleeSwing)
alarm[1] = global.frameRate*.05/invSlot[invSelect].meleeRate
break

case 1:
itemDist = 8
itemDir = (round(facing/15)*15)+(15*meleeSwing)
itemHeight = hipsHeight+4-hipsBounce
itemRot = (round(facing/15)*15)+(135*meleeSwing)
alarm[1] = global.frameRate*.05/invSlot[invSelect].meleeRate
break

case 2:
itemDist = -6
itemDir = (round(facing/15)*15)-(15*meleeSwing)
itemHeight = hipsHeight+2-hipsBounce
itemRot = (round(facing/15)*15)+(150*meleeSwing)
alarm[1] = global.frameRate*.1/invSlot[invSelect].meleeRate
scr_meleeHit()
itemDist = 18
break

case 3:
itemDist = 13
itemDir = (round(facing/15)*15)+(15*meleeSwing)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)+(135*meleeSwing)
alarm[1] = global.frameRate*.3
scr_sheen()
sweetSpot = true
break

case 4:
itemDist = 12
itemDir = (round(facing/15)*15)+(45*meleeSwing)
itemHeight = hipsHeight-hipsBounce
itemRot = (round(facing/15)*15)+(150*meleeSwing)
alarm[1] = global.frameRate*.3/invSlot[invSelect].meleeRate
sweetSpot = false
break

case 5:
meleeSwing = 1
scr_meleeEnd()
alarm[1] = 1
break
}
