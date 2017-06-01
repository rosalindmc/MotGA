//Throw Any Script
animStep[1] += 1
meleeSwing = 1

switch(argument0)
{
case 0:
itemDist = 12
itemDir = (round(facing/15)*15)+(15*meleeSwing)
itemHeight = hipsHeight+3-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*.1
break

case 1:
itemDist = 15
itemDir = (round(facing/15)*15)-(0*meleeSwing)
itemHeight = hipsHeight+2-hipsBounce
itemRot = (round(facing/15)*15)-(0*meleeSwing)
alarm[1] = global.frameRate*.1
scr_throwProj()
break

case 2:
itemDist = 12
itemDir = (round(facing/15)*15)+(45*meleeSwing)
itemHeight = hipsHeight+1-hipsBounce
itemRot = (round(facing/15)*15)-(0*meleeSwing)
alarm[1] = global.frameRate*.1
break

case 3:
itemDist = 12
itemDir = (round(facing/15)*15)+(60*meleeSwing)
itemHeight = hipsHeight+1-hipsBounce
itemRot = (round(facing/15)*15)-(0*meleeSwing)
alarm[1] = global.frameRate*.3
break

case 4:
itemDist = 12
itemDir = (round(facing/15)*15)+(60*meleeSwing)
itemHeight = hipsHeight-hipsBounce
itemRot = (round(facing/15)*15)-(15*meleeSwing)
alarm[1] = global.frameRate*.2
break

case 5:
anim[1] = scr_swordIdle
animStep[1] = 0
canAttack = true
meleeCharge = 0
hold = 0
sweetSpot = 0
moveMult = 1
alarm[1] = 1
break
}
