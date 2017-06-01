animStep[0] += 1

switch(argument0)
{
case 0:
zspd -= (25*metre)/global.frameRate
hipsImage = 2
hipsBounce = 0 
hipsRot = -15*facingH
bodyRot = -30*facingH
hairRot = -45*facingH
headImage = 17
hairImage = 18
bodyImage = 12
alarm[0] = global.frameRate*.05
break

case 1:
hipsImage = 6
hipsBounce = 1
hipsRot = -90+facing
bodyRot = -90+facing
hairRot = -90+facing
headRot = -90+facing
headImage = 16
hairImage = 19
bodyImage = 14
xAdj = lengthdir_x(-10,facing)
yAdj = 10
alarm[0] = global.frameRate*.2

break

case 2:
hipsImage = 10
hipsBounce = 0 
hipsRot = -150*facingH
bodyRot = -240*facingH
hairRot = -240*facingH
headRot = -270*facingH
headImage = 16
hairImage = 18
bodyImage = 14
xAdj = -5*facingH
yAdj = 20
alarm[0] = global.frameRate*.05
hspd = lengthdir_x(metre*dodgeSpeed/global.frameRate,facing)
vspd = lengthdir_y(metre*dodgeSpeed/global.frameRate,facing)

//Step
if grid.snow = true
{
    repeat(choose(20,30,40))
    {
    i = instance_create(x,y,obj_boneDust)
    i.sprite_index = spr_snow
    i.h = h+1
    }
}
else
{
    i = instance_create(x,y,obj_dust)
    i.image_xscale = 1.5*facingH
    i.image_yscale = 1.5
}
break

case 3:
hipsImage = 10
hipsBounce = 0 
hipsRot = -180*facingH
bodyRot = -270*facingH
hairRot = -270*facingH
headRot = -300*facingH
headImage = 16
hairImage = 18
bodyImage = 14
xAdj = 0
yAdj = 25
alarm[0] = global.frameRate*.05
break

case 4:
hipsImage = 10
hipsBounce = 0 
hipsRot = -210*facingH
bodyRot = -300*facingH
hairRot = -300*facingH
headRot = -330*facingH
headImage = 16
hairImage = 18
bodyImage = 14
xAdj = 5*facingH
yAdj = 20
alarm[0] = global.frameRate*.05
break

case 5:
hipsImage = 10
hipsBounce = 0 
hipsRot = -240*facingH
bodyRot = -330*facingH
hairRot = -330*facingH
headRot = 0*facingH
headImage = 16
hairImage = 18
bodyImage = 14
xAdj = 5*facingH
yAdj = 10
alarm[0] = global.frameRate*.05
break

case 6:
hipsImage = 4
hipsBounce = 0 
hipsRot = -270*facingH
bodyRot = 0*facingH
hairRot = -270*facingH
headRot = -30*facingH
headImage = 16
hairImage = 18
bodyImage = 14
alarm[0] = global.frameRate*.05
break

case 7:
hipsImage = 2
hipsBounce = 0 
hipsRot = 30*facingH
bodyRot = -0*facingH
hairRot = -90*facingH
headRot = 0*facingH
headImage = 16
hairImage = 18
bodyImage = 14
alarm[0] = global.frameRate*.05
break
}
