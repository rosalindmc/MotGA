//Sword Swing Script
animStep[1] += 1
meleeSwing = 1

switch(argument0)
{
case 0:
attackMask = spr_stab
meleeType = 'piercing'
itemDist = 12
itemDir = (round(facing/15)*15)+(15*meleeSwing)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*.1/invSlot[invSelect].meleeRate
break

case 1:
itemDist = 15
itemDir = (round(facing/15)*15)-(0*meleeSwing)
itemHeight = hipsHeight+2-hipsBounce
itemRot = (round(facing/15)*15)-(0*meleeSwing)
alarm[1] = global.frameRate*.1/invSlot[invSelect].meleeRate
scr_meleeHit()
break

case 2:
itemDist = 12
itemDir = (round(facing/15)*15)+(45*meleeSwing)
itemHeight = hipsHeight+1-hipsBounce
itemRot = (round(facing/15)*15)-(0*meleeSwing)
alarm[1] = global.frameRate*.1/invSlot[invSelect].meleeRate
break

case 3:
itemDist = 12
itemDir = (round(facing/15)*15)+(60*meleeSwing)
itemHeight = hipsHeight+1-hipsBounce
itemRot = (round(facing/15)*15)-(0*meleeSwing)
alarm[1] = global.frameRate*.3
scr_sheen()
sweetSpot = true
break

case 4:
itemDist = 12
itemDir = (round(facing/15)*15)+(60*meleeSwing)
itemHeight = hipsHeight-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*.2/invSlot[invSelect].meleeRate
sweetSpot = false
break

case 5:
meleeSwing = 1
scr_meleeEnd()
alarm[1] = 1
break
}
