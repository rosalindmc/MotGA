with(global.pc)
{
    i = 1
    repeat(array_length_1d(invSlot)-1)
    {
        if instance_exists(invSlot[i])
        {
            draw_set_font(fnt_basic)
            draw_set_halign(fa_left)
            if i = invSelect
            {
                scr_drawText(c_black,c_yellow,view_xview[0]+10,view_yview[0]+view_hview[0]-(10*i),invSlot[i].name)
            }
            else
            {
                scr_drawText(c_black,c_white,view_xview[0]+10,view_yview[0]+view_hview[0]-(10*i),invSlot[i].name)        
            }
        }
        else
        {
            draw_set_font(fnt_basic)
            draw_set_halign(fa_left)
            scr_drawText(c_black,c_white,view_xview[0]+10,view_yview[0]+view_hview[0]-(10*i),'-')        
        }
    i += 1
    }
}
