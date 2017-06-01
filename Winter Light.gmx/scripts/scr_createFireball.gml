#define scr_createFireball
if !collision_line(x,y,x+lengthdir_x(20,facing),y+lengthdir_y(20,facing),obj_solid,false,true)
{
i = instance_create(x+lengthdir_x(20,facing),y+lengthdir_y(20,facing),obj_fireball)

i.h = targetH
i.dmg = 2
i.spd = (150*metre)/global.frameRate
i.owner = id
i.attacker = id
i.direction = point_direction(x,y,targetX,targetY)
i.alarm[1] = (point_distance(x,y,mouse_x,mouse_y))/i.spd
}

#define scr_cauterize
i = instance_create(x,y,obj_cauterize)
i.owner = id

audio_play_sound(snd_cauterize,0,false)