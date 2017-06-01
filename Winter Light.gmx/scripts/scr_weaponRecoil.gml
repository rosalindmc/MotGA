//Recoil Script
animStep[1] += 1

switch(argument0)
{
case 0:
itemDist = 12
itemDir = (round(facing/15)*15)+(90*meleeSwing)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)+(135*meleeSwing)
alarm[1] = global.frameRate*.1
break

case 1:
itemDist = 12
itemDir = (round(facing/15)*15)+(135*meleeSwing)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)+(150*meleeSwing)
alarm[1] = global.frameRate*.1
break

case 2:
itemDist = 12
itemDir = (round(facing/15)*15)+(135*meleeSwing)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)+(225*meleeSwing)
alarm[1] = global.frameRate*.1
break

case 3:
itemDist = 12
itemDir = (round(facing/15)*15)+(150*meleeSwing)
itemHeight = hipsHeight+5-hipsBounce
itemRot = (round(facing/15)*15)+(225*meleeSwing)
alarm[1] = global.frameRate*.1
break

case 4:
scr_meleeEnd()
alarm[1] = 1
break
}
