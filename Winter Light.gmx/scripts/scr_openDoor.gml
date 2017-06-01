#define scr_openDoor
name = 'Close Door'
useType = scr_closeDoor

audio_play_sound(snd_door,0,false)

door.mask_index = spr_none
door.door[1].closed = false
door.door[2].closed = false

if door.sprite_index = spr_hminiwall
{
    if argument0.y < y
    {
        door.door[1].rotate = -660/global.frameRate*(.75+random(.25))
        door.door[2].rotate = 660/global.frameRate*(.75+random(.25))
    }
    else
    {
        door.door[1].rotate = 660/global.frameRate*(.75+random(.25))
        door.door[2].rotate = -660/global.frameRate*(.75+random(.25))
    }
}
else
{
    if argument0.x < x
    {
        door.door[1].rotate = 660/global.frameRate*(.75+random(.25))
        door.door[2].rotate = -660/global.frameRate*(.75+random(.25))
    }
    else
    {
        door.door[1].rotate = -660/global.frameRate*(.75+random(.25))
        door.door[2].rotate = 660/global.frameRate*(.75+random(.25))
    }
}

#define scr_closeDoor
if (door.sprite_index = spr_hminiwall and !collision_rectangle(x-9,y-2,x+9,y+2,obj_solid,false,true)) 
or (door.sprite_index = spr_vminiwall and !collision_rectangle(x-2,y-9,x+2,y+9,obj_solid,false,true))
{
audio_play_sound(snd_doorClose,0,false)
name = 'Open Door'
useType = scr_openDoor

if door.sprite_index = spr_hminiwall
{
    door.mask_index = spr_hminiwall
}
else
{
    door.mask_index = spr_vminiwall
}

door.door[1].closed = true
door.door[2].closed = true
}