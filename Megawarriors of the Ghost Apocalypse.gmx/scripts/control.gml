#define control


#define controlInitialize
//Essentials
global.frameRate = 60
global.timeMult = 1

//Controls
global.upKey = ord('W')
global.leftKey = ord('A')
global.downKey = ord('S')
global.rightKey = ord('D')

//Create pc
global.pc = instance_create(x,y,obj_char)

/*
x = room_width/2
y = room_height/2

window_set_cursor(cr_none)
shake = 0
kick = 0

global.frameRate = 60

room_speed = global.frameRate


randomize()

#define controlStep
/*
if instance_exists(global.pc)
{
ix = (global.pc.x+global.pc.x+mouse_x)*.3333
iy = (global.pc.y+global.pc.y+mouse_y)*.3333
x = round(((ix+x)*.5)-shake+random(shake*2))
y = round(((iy+y)*.5)-shake+random(shake*2))
}

if shake > .1
{
shake -= shake*(5/global.frameRate)
}
else
{
shake = 0
}

if global.pc.vis = true and global.win = false
{
    black -= 1/global.frameRate
}
else
{
    black += .5/global.frameRate
    if keyboard_check_pressed(global.interactKey)
    {
        room_restart()
    }
    if keyboard_check_pressed(vk_escape)
    {
        game_restart()
    }
}

#define controlDrawbegin
/*Draw Backdrops
draw_sprite(spr_backdrop,0,
view_xview[]+(view_wview[]/2)+(480*(.5-(x/room_width))),
view_yview[]+(view_hview[]/2)+(270*(.5-(y/room_height))))

#define controlDrawHUD
/*
draw_sprite(spr_reticle,0,mouse_x,mouse_y)
draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y-kick,1,1,0,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x-kick,mouse_y+kick,1,1,90,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y+kick,1,1,180,c_white,1)
draw_sprite_ext(spr_reticle2,0,mouse_x+kick,mouse_y-kick,1,1,270,c_white,1)

if instance_exists(global.pc)
{
    //scr_hudVital(20,20,global.pc)
    //scr_hudItem()
}

if black > 0
{
    draw_set_colour(c_black)
    draw_set_alpha(black)
    draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,false)

    if global.pc.vis = false
    {
        draw_set_halign(fa_center)
        draw_set_valign(fa_center)
        draw_set_font(fnt_dmgHuge)
        drawText(c_black,c_red,view_xview+(view_wview/2),view_yview+(view_hview/2),'DEAD')
    }
}
