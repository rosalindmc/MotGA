#define scr_playerControl
//Move Control
upKey = keyboard_check(global.upKey)
leftKey = keyboard_check(global.leftKey)
downKey = keyboard_check(global.downKey)
rightKey = keyboard_check(global.rightKey)

lftclickKey = mouse_check_button(mb_left)
rgtclickKey = mouse_check_button(mb_right)
lftclickedKey = mouse_check_button_pressed(mb_left)
rgtclickedKey = mouse_check_button_pressed(mb_right)
lftreleaseKey = mouse_check_button_released(mb_left)
rgtreleaseKey = mouse_check_button_released(mb_right)
dodgeKey = keyboard_check_pressed(global.dodgeKey)
sprintKey = keyboard_check(global.sprintKey)
interactKey = keyboard_check_pressed(global.interactKey)
reloadKey = keyboard_check_pressed(global.reloadKey)
throwKey = keyboard_check_pressed(global.throwKey)
throwReleasedKey = keyboard_check_released(global.throwKey)
sneakKey = keyboard_check_pressed(global.sneakKey)
emptyKey = keyboard_check(global.emptyKey)

i = 1
repeat(10)
{
    itemKey[i] = keyboard_check_pressed(global.itemKey[i])
    i += 1
}

//Player Lighting Step
scr_playerLighting()

//Sprint Control
if sprintKey = true and sp > 0
{
    sprinting = true
}
else
{
    sprinting = false
}

//Movement
scr_moveControl()

//Dodge Control
if dodgeKey = true and canMove = true and sp >= dodgeCost and point_distance(x,y,pointx,pointy) > 5
{
    scr_dodge()  
}

//Interact
if interactKey = true
{
if canAttack = true and canAct = true
{

    scr_interact()  
}
}

//Throw
if instance_exists(invSlot[invSelect])
{
    if throwKey = true
    {
            with(invSlot[invSelect])
            {
                scr_throwing(1)
            }
    }
    
    if throwReleasedKey = true
    {
            with(invSlot[invSelect])
            {
                scr_throwing(2)
            }
    }
}

//Attack
if instance_exists(invSlot[invSelect])
{
    if lftclickedKey = true
    {
        with(invSlot[invSelect])
        {
            script_execute(use[1],1)
        }
    }
    if lftreleaseKey = true
    {
        with(invSlot[invSelect])
        {
            script_execute(use[1],2)
        }
    }
}

//Flame Magic
if rgtclickedKey = true and vis = true
{
    //Fire
    if fire >= 30
    {
        fire -= 30
        if point_distance(x,y,targetX,targetY) < 30
        {
            scr_cauterize()
        }
        else
        {
            scr_createFireball()
        }
    }
}

//Inventory
if canAttack = true and canAct = true
{
    i = 1
    repeat(array_length_1d(invSlot)-1)
    {
        if itemKey[i] = true 
        {
            invSelect = i
            if instance_exists(invSlot[invSelect])
            {
                anim[1] = invSlot[invSelect].anim[0]
            }
        }
    i += 1
    }
    
    if mouse_wheel_up()
    {
        scr_scrollItems(1)
    }
    
    if mouse_wheel_down()
    {
        scr_scrollItems(-1)
    }
}

//Targeting
targetX = mouse_x
targetY = mouse_y

//Adjust Camera
obj_camera.kick = kick
obj_camera.h = targetH

#define scr_scrollItems
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
}