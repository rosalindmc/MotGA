#define scr_humanoidWalk
animStep[0] += sign(moving)
alarm[0] = (global.frameRate*.3)/max(1,abs((60*moving)/global.frameRate))

switch(argument0)
{
case 0:
animStep[0] = 4
scr_humanoidWalk(4)
break

case 1:
hipsImage = 4
hipsBounce = 0 
headImage = 17
hairImage = 18
bodyImage = 12
break

case 2:
hipsImage = 2
hipsBounce = 1
headImage = 16
hairImage = 19
bodyImage = 14

//Step
scr_step()
break

case 3:
hipsImage = 6
hipsBounce = 0 
headImage = 17
hairImage = 18
bodyImage = 12
break

case 4:
hipsImage = 2
hipsBounce = 1
headImage = 16
hairImage = 19
bodyImage = 12

//Step
scr_step()
break

case 5:
animStep[0] = 1
scr_humanoidWalk(1)
break
}

#define scr_step
//Step
if pc = true
{
if grid.snow = true
{
    repeat(choose(2,3,4))
    {
    i = instance_create(x,y,obj_snow)
    i.h = h+1
    }
    
    i = instance_create(x,y,obj_footPrint)
    i.h = h
    i.image_angle = point_direction(0,0,hspd,vspd)
    i.image_yscale = 1
    audio_play_sound(snd_snow,0,false)
}
else
{
    i = instance_create(x,y,obj_dust)
    i.image_xscale = facingH
    audio_play_sound(choose(s1_inside,s2_inside,s3_inside,s4_inside,
    s5_inside,s6_inside,s7_inside,s8_inside,
    ),0,false)
}
}