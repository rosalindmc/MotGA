//Draw or Update a toggle
//scr_menuToggle(Howtouse,Slider#)

switch(argument0)
{
case 1:     //Click
    switch(argument1)
    {
        case 0: global.commandMode = true-global.commandMode break
    }
break

case 2:     //Draw
    switch(argument1)
    {
        case 0: if global.commandMode = 1 scr_drawText(c_gray,c_white,x+220,y,'On')
        else scr_drawText(c_gray,c_white,x+220,y,'Off') break
    }
break
}
