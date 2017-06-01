owner.image_index = 1

i = instance_create(x,y+5,obj_item)
i.direction = 210+random(120)
i.spd += 5*metre/global.frameRate
i.h = 5
i.itemType = choose(item_greenPot,item_redPot,item_bluePot,item_axe,item_sword)
instance_destroy()

audio_play_sound(snd_door,0,false)
