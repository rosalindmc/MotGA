animStep[0] += 1

switch(argument0)
{
case 0:
flinch = -1
hipsImage = 10
hipsBounce = 0 
hipsRot = 30*facingH
bodyRot = 30*facingH
hairRot = 90*facingH
headImage = 17
hairImage = 19
bodyImage = 14
alarm[0] = global.frameRate*.1
break

case 1:
hipsImage = 10
hipsBounce = 0 
hipsRot = 15*facingH
bodyRot = 15*facingH
hairRot = 45*facingH
headImage = 17
hairImage = 19
bodyImage = 12
alarm[0] = global.frameRate*.1
break

case 2:
flinch = 1
hipsImage = 4
hipsBounce = 0 
hipsRot = 15*facingH
bodyRot = 15*facingH
hairRot = 15*facingH
headImage = 16
hairImage = 18
bodyImage = 14
alarm[0] = global.frameRate*.1
break

case 3:
hipsImage = 2
hipsBounce = 0 
hipsRot = 15*facingH
bodyRot = 15*facingH
hairRot = -15*facingH
headImage = 16
hairImage = 18
bodyImage = 12
alarm[0] = global.frameRate*.2
break

case 4:
alarm[0] = global.frameRate*.2
break

case 5:
alarm[0] = global.frameRate*.2
break
}
