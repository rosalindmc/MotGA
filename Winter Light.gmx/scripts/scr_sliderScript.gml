//Update or Establish a slider
//scr_sliderScript(Howtouse,Slider#)
//1 = establish variables, 2 = update, 3 = drawVar

switch(argument0)
{
case 1:     //Initialize
    switch(argument1)
    {
    case 0: bar.x += global.effectVolume*90 break
    case 1: bar.x += global.voiceVolume*90 break
    case 2: bar.x += global.musicVolume*90 break
    case 3: bar.x += global.ambienceVolume*90 break
    case 4: bar.x += (global.frameRate/2)-15 bar.snap = 10 sections = 9 break
    }
break

case 2:     //Update
    switch(argument1)
    {
    case 0: global.effectVolume = (bar.x-bar.minX)/90 break
    case 1: global.voiceVolume = (bar.x-bar.minX)/90 break
    case 2: global.musicVolume = (bar.x-bar.minX)/90 break
    case 3: global.ambienceVolume = (bar.x-bar.minX)/90 break
    case 4: global.frameRate = 15+((bar.x-bar.minX)/2) break
    }
break

case 3:     //Draw
    switch(argument1)
    {
    case 0: if global.effectVolume = 0 scr_drawText(c_gray,c_white,x+220,y,'Muted')
    else scr_drawText(c_gray,c_white,x+220,y,string(round(100*global.effectVolume))+'%') break
    case 1: if global.voiceVolume = 0 scr_drawText(c_gray,c_white,x+220,y,'Muted')
    else scr_drawText(c_gray,c_white,x+220,y,string(round(100*global.voiceVolume))+'%') break
    case 2: if global.musicVolume = 0 scr_drawText(c_gray,c_white,x+220,y,'Muted')
    else scr_drawText(c_gray,c_white,x+220,y,string(round(100*global.musicVolume))+'%') break
    case 3: if global.ambienceVolume = 0 scr_drawText(c_gray,c_white,x+220,y,'Muted')
    else scr_drawText(c_gray,c_white,x+220,y,string(round(100*global.ambienceVolume))+'%') break
    
    case 4: 
    scr_drawText(c_gray,c_white,x+220,y,string(global.frameRate)+' FPS') 
    }
break
}
