//Draws Tooltips on interactables, sets interact variable
global.ix = targetX
global.iy = targetY-h
global.char = id
global.i = 30
global.id = -4
    with(obj_interactable)
    {
        if distance_to_point(global.char.x,global.char.y) < 40
        {
        if distance_to_point(global.ix,global.iy) < global.i
        {
            global.id = id
            global.i = distance_to_point(global.ix,global.iy)
        }
        }
    }
    
    pointerInteract = global.id
    
    if pointerInteract != -4
    {    
        with(pointerInteract)
        {
        draw_set_font(fnt_basicPlus)
        draw_set_halign(fa_center)
        scr_drawText(c_black,c_white,x,y-15,name)
        }
    }
