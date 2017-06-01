//Look through inventory slots to find empty one
i = 1
ii = false
repeat(array_length_1d(argument0.invSlot)-1)
{
    if argument0.invSlot[i] = -4 and ii = false
    {
        iii = instance_create(x,y,obj_itemCarried)
        ii = true
        iii.slot = i
        iii.owner = argument0
        argument0.invSlot[i] = iii
        global.item = itemType
        
        if i = argument0.invSelect
        {
        argument0.anim[1] = anim[0]
        }
        
        if argument0.pc = true
        {
        //Play Sound
        audio_play_sound(snd_pickupLoose,0,false)
        }
        
        with(iii)
        {
            script_execute(global.item, 0)
        }
        
        instance_destroy()
    }
    else
    {
        i += 1
    }
}

