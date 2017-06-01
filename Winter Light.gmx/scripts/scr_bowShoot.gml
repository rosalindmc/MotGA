//Bow Fire Script
animStep[1] += 1

switch(argument0)
{
case 0:
strike = 0
itemDist = 12
itemDir = (round(facing/15)*15)
itemHeight = hipsHeight+4-hipsBounce
itemRot = (round(facing/15)*15)
itemImage = 2
alarm[1] = global.frameRate*.05/invSlot[invSelect].fireRate
break

case 1:
itemDist = 12
itemDir = (round(facing/15)*15)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)
itemImage = 1
alarm[1] = global.frameRate*.05/invSlot[invSelect].fireRate
arrows -= 1
scr_fire()
break

case 2:
itemDist = 12
itemDir = (round(facing/15)*15)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)
alarm[1] = global.frameRate*.1/invSlot[invSelect].fireRate
break

case 3:
itemDist = 12
itemDir = (round(facing/15)*15)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)
alarm[1] = global.frameRate*.3
scr_sheen()
sweetSpot = true
break

case 4:
itemDist = 12
itemDir = (round(facing/15)*15)-(15*facingH)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)-(15*facingH)
alarm[1] = global.frameRate*.3/invSlot[invSelect].fireRate
sweetSpot = false
break

case 5:
scr_rangedEnd()
alarm[1] = 1
break
}
