animStep[0] += 1

switch(argument0)
{
case 0:
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
hipsRot = 45*facingH
bodyRot = 60*facingH
headRot = 45*facingH
hairRot = 135*facingH
headImage = 17
hairImage = 19
bodyImage = 12
alarm[0] = global.frameRate*.1
break

case 2:
flinch = 1
hipsImage = 4
hipsBounce = 0 
hipsRot = 90*facingH
bodyRot = 90*facingH
headRot = 60*facingH
hairRot = 180*facingH
headImage = 16
hairImage = 18
bodyImage = 14
alarm[0] = global.frameRate*.1
break

case 3:
hipsImage = 2
hipsBounce = 0 
hipsRot = 90*facingH
bodyRot = 90*facingH
headRot = 90*facingH
hairRot = 105*facingH
headImage = 16
hairImage = 18
bodyImage = 12
alarm[0] = global.frameRate*.1
break

case 4:
hipsImage = 2
hipsBounce = 0 
hipsRot = 90*facingH
bodyRot = 90*facingH
headRot = 90*facingH
hairRot = 90*facingH
headImage = 16
hairImage = 18
bodyImage = 12
break
}
