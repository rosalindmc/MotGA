i = 0
repeat(global.pc.hpMax)
{
draw_sprite(spr_health,1,view_xview[0]+15+(5*i),view_yview[0]+15)
i += 1
}

i = 0
repeat(ceil(global.pc.hp))
{
draw_sprite_ext(spr_health,0,view_xview[0]+15+(5*i),view_yview[0]+15,1,1,0,c_white,global.pc.hp-i)
i += 1
}

i = 0
repeat(global.pc.arrows)
{
draw_sprite(spr_arrowHUD,1,view_xview[0]+view_wview[0]-15-(5*i),view_yview[0]+15)
i += 1
}

//Draw Health Number
draw_set_valign(fa_middle)
draw_set_halign(fa_left)
draw_set_font(fnt_small)
scr_drawText(c_black,c_white,view_xview[0]+20,view_yview[0]+14,string(round(global.pc.hp))+" / "+string(round(global.pc.hpMax)))

//Stamina
i = 0
repeat(global.pc.spMax)
{
draw_sprite(spr_stamina,1,view_xview[0]+15+(10*i)+(5*floor(i*.5)),view_yview[0]+30)
i += 1
}

i = 0
repeat(ceil(global.pc.sp))
{
draw_sprite_ext(spr_stamina,0,view_xview[0]+15+(10*i)+(5*floor(i*.5)),view_yview[0]+30,1,1,0,c_white,global.pc.sp-i)
i += 1
}

