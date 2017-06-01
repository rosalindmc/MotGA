//Floor drawing script
//scr_floor_draw()

if losVis = true
{
draw_sprite_ext(sprite,0,x,y-h,image_xscale,1,0,c_white,1)

var i = 0
repeat(level+1)
{
draw_sprite(sprite,1,x,y-h+w+(i*20))
i += 1
}
}
