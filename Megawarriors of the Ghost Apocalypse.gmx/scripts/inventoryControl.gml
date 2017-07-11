#define inventoryControl
scrollItems()

if inventoryKey = true
{
    var p = (point_direction(view_xview+(view_wview/2),view_yview+(view_hview/2), -mouse_x + view_wview, mouse_y)+280)%360
    
    hoverItem = floor(p/(360/inventorySize))
    
    if lftclickedKey = true
    {
        switchItem(hoverItem,1)
    }
    
    if rgtclickedKey = true
    {
        switchItem(hoverItem,2)
    }   
    hoverItem = floor((p/(360/inventorySize)))
}

if lftclickedKey = true
{
}

if rgtclickedKey = true
{
}

//While switch Items is on, divide screen radially
//Set a hoverItem variable to current section
//Left click to assign right hand to current section
//Right click to assign left hand to current section

//Will need corresponding code Draw HUD, set a variable to do this

#define inventoryControlHUD
//While switch Items is on, divide screen radially
//highlight hoverItem,

//Black Out everything else (later use a shader)
draw_set_alpha(.5)
draw_set_colour(c_black)
draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,false)

//HUD Circle
invCircle = surface_create(200,200)
surface_set_target(invCircle)
draw_set_colour(c_white)
draw_circle(100,100,90,false)
//Highlight segment somehow later
//draw_set_blend_mode(bm_add)
//draw_set_colour(c_yellow)
//draw_triangle(100,100,100+lengthdir_x(100,(360/(inventorySize))-1+(hoverItem*(360/inventorySize))),100+lengthdir_y(100,(360/(inventorySize))-1+(hoverItem*(360/inventorySize))),100+lengthdir_x(100,(hoverItem*(360/inventorySize))+1),100+lengthdir_y(100,(hoverItem*(360/inventorySize))+1),false)
draw_set_alpha(1)
draw_set_blend_mode(bm_subtract)
draw_circle(100,100,15,false)
for(i = 0; i < inventorySize; i++)
{
    draw_line_width(100,100,100+lengthdir_x(100,(i*(360/inventorySize))),100+lengthdir_y(100,(i*(360/inventorySize))),2)
}
surface_reset_target()
draw_set_blend_mode(bm_normal)
draw_surface(invCircle,view_xview+(view_wview/2)-100,view_yview+(view_hview/2)-100)


for(i = 1; i <= inventorySize; i++)
{
    ix = view_xview+(view_wview/2)+lengthdir_x(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    iy = view_yview+(view_hview/2)+lengthdir_y(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    
    if handItemSlot[1] = inventorySize- i
    {
        drawText(c_black,c_green,ix,iy+20,'Right Hand')
    }
    
    if handItemSlot[2] = inventorySize- i
    {
        drawText(c_black,c_red,ix,iy+30,'Left Hand')
    }
}

for(i = 1; i <= inventorySize; i++)
{
    ix = view_xview+(view_wview/2)+lengthdir_x(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    iy = view_yview+(view_hview/2)+lengthdir_y(75,(360/(inventorySize*2))+(i*(360/inventorySize))+(360/inventorySize)*round(inventorySize/4))
    
    if inventory[inventorySize-i] != noone
    { 
        draw_sprite(inventory[inventorySize-i].sprite_index,0,ix,iy)
        if hoverItem = inventorySize-i
        {
            drawText(c_black,c_yellow,ix,iy+10,inventory[inventorySize-i].name)
        }
        else
        {
            drawText(c_black,c_white,ix,iy+10,inventory[inventorySize-i].name)
        }
    }
    else
    {
        if hoverItem = inventorySize-i
        {
            drawText(c_black,c_yellow,ix,iy,'Empty')
        }
        else
        {
            drawText(c_black,c_white,ix,iy,'Empty')
        }
    }
}


#define scrollItems
if mouse_wheel_up()
{
    for(i = handItemSlot[1]; i < inventorySize; i++)
    {
        if inventory[i] != noone
        {
            switchItem(i,1)
            break
        }
        
        switchItem(-1,1)
    }
}



//Mouse Wheel up to make right hand switch to next item, cycling
//Mouse Wheel down to cycle left hand

/*
invSelect += argument0

if invSelect > array_length_1d(invSlot)-2
{
    invSelect = 1 
}
if invSelect < 1
{
    invSelect = array_length_1d(invSlot)-1
}


repeat(array_length_1d(invSlot)-2)
{
    if !instance_exists(invSlot[invSelect])
    {
        invSelect += argument0
        
        if invSelect > array_length_1d(invSlot)-2
        {
            invSelect = 1 
        }
        if invSelect < 1
        {
            invSelect = array_length_1d(invSlot)-1
        }
    }   
}   
        
if instance_exists(invSlot[invSelect])
{
    anim[1] = invSlot[invSelect].anim[0]
<<<<<<< HEAD
}

#define switchItem
//Clear item currently held in hand
if handItem[argument1] != noone
{
    if greatWeapon = false
    {
        handItem[argument1].hand = 0
    }
    else
    {
        handItem[argument1].hand = 3-argument1
    }
}

if argument0 != -1
{
    //Switch to new item
    handItem[argument1] = inventory[argument0]
    
    //Assign new item to hand and hand to new item
    if handItem[argument1] != noone
    {
        handItemSlot[argument1] = argument0
        inventory[argument0].hand = argument1
    }
    else
    {
        handItemSlot[argument1] = -1
    }
}

//If both hands are on the same item wield it in two hands
if handItemSlot[1] = handItemSlot[2] and handItem[1] != noone
{
    greatWeapon = true
    greatWeaponSize = 1
    handItem[1].hand = 1
}
else
{
    greatWeapon = false
}