#define control


#define controlInitialize
//Essentials
global.frameRate = 60
global.timeMult = 1
enumerators();

//Controls
global.upKey = ord('W')
global.leftKey = ord('A')
global.downKey = ord('S')
global.rightKey = ord('D')

//Create pc
global.pc = instance_create(x,y,obj_char)

<<<<<<< HEAD
//temp node
global.currLevel = instance_create(0,0,obj_level)

with (global.currLevel){
    biomeType = 4
    elements[0] = 0
    sizeX = 20
    sizeY = 20
    
    critPoi = 1     //the type of the critical point of interest
    poiDensity = 4 //number of points of interest on the map
    numEntrance = 2
    pois[0]=0
    
    critPods = 0    //number of pods on the critical path
    podDensity = 0  //number of pods on the map
    
    itemDensity = 0 //number of item spawns on the map
    
    specialAreas = 0   //number of special areas to spawn
    
    floorLayout[sizeX,sizeY] = 0    //the map of floors and walls
    
    genLevel()
    roadMaker()
}

=======
//Camera
shake = 0
>>>>>>> origin/master

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
//Adjust Camera Position
if instance_exists(global.pc)
{
    ix = (global.pc.x+global.pc.x+mouse_x)*.3333
    iy = (global.pc.y+global.pc.y+mouse_y)*.3333
    x = round(((ix+x)*.5)-shake+random(shake*2))
    y = round(((iy+y)*.5)-shake+random(shake*2))
}

//Camera
view_xview[0] = median(0,x-320,room_width-640)
view_yview[0] = median(0,y-180,room_height-360)

//Reduce Shake
if shake > .1
{
    shake -= shake*(5/global.frameRate)
}
else
{
    shake = 0
}

/*
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

<<<<<<< HEAD
*/


//Temp draw map for testing level gen

    
with(global.currLevel){
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(fnt_menu)

    for (var i=0; i<sizeX; i++){
        for (var j=0; j<sizeX; j++){
            if(floorLayout[i,j].isPath == true){
                drawText(c_black,c_red,i*metre*2+10,j*metre*2+10,floorLayout[i,j].weight);
            }
            else if (floorLayout[i,j].hasPoi == true){
                drawText(c_black,c_green,i*metre*2+10,j*metre*2+10,floorLayout[i,j].weight);
            }
            else{
                drawText(c_black,c_white,i*metre*2+10,j*metre*2+10,floorLayout[i,j].weight);
            }
        }
    }
}







=======
>>>>>>> origin/master
#define enumerators
enum biomeGen{
    none = 0,
    swamp = 1,
    mountain = 2,
    plain = 3,
    forest = 4,
    cave = 10,
    temple = 11,
    dungeon = 12
}

enum biomeElem{
    none = 0,
    ghost = 1,
    metal = 2,
    leaf = 3,
    fire = 4,
    chaos = 10,
    law = 11,
    good = 12,
    evil = 13,
    debrah = 14
}

enum levelSize{
    small = 40,
    medium = 60,
    large = 80
}

enum poiType{
    none = 0,
    shrine = 1,
    site = 2,
    port = 3,
    miniboss = 10,
    specItem = 11,
    specChar = 12,
    dungeonPort = 13
    //Doors and Keysssss?
}

enum dmgType{
    normal = 0,
    rend = 1,
    impact = 2,
    pierce = 3,   
    fire = 4,
    cold = 5,
    corrode = 6,
    lightning = 7,
    radiant = 8,
    profane = 9,
    poison = 10,
    blood = 11,
    mind = 12,
    thunder = 13
}
<<<<<<< HEAD

enum podType{
    none = 0,
    minions = 1   
}

enum itemType{
    none = 0,
    knife = 1
}

enum bossType{
    none = 0,
    champion = 1
}

=======
>>>>>>> origin/master
