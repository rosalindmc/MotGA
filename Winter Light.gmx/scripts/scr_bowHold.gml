//Bow Hold Script
animStep[1] += 1

switch(argument0)
{
case 0:
itemImage = 0
itemDist = 12
itemDir = (round(facing/15)*15)-(15*facingH)
itemHeight = hipsHeight+2-hipsBounce
itemRot = (round(facing/15)*15)-(15*facingH)
alarm[1] = global.frameRate*.1/invSlot[invSelect].meleeRate
break

case 1:
itemImage = 2
itemDist = 12
itemDir = (round(facing/15)*15)
itemHeight = hipsHeight+4-hipsBounce
itemRot = (round(facing/15)*15)
alarm[1] = global.frameRate*.7/invSlot[invSelect].meleeRate
break

case 2:
itemImage = 3
itemDist = 12
itemDir = (round(facing/15)*15)
itemHeight = hipsHeight+4-hipsBounce
itemRot = (round(facing/15)*15)
alarm[1] = global.frameRate*.2/invSlot[invSelect].meleeRate
scr_sheen()
meleeCharge = 2
sweetSpot = true
break

case 3:
itemImage = 3
itemDist = 12
itemDir = (round(facing/15)*15)
itemHeight = hipsHeight+4-hipsBounce
itemRot = (round(facing/15)*15)
alarm[1] = global.frameRate*1/invSlot[invSelect].meleeRate
sweetSpot = false
break

case 4:
scr_meleeSwing(1)
alarm[1] = 1
break
}

if arrows = 0
{
itemImage = 1
}
