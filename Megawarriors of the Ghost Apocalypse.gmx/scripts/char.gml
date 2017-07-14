#define char


#define charCreate

#define charInitialize
//Art Essentials
animType = humanoid
animUpdate = true

//Temp Run animType Initialize (move to a create char script later so this can be adjusted)
script_execute(animType,0)

//Movement Essentials
movement = 12        //Metres per second
moveMult = 1        //Malleable multiplier for movement speed
moveDT = 0          //Difficult terrain divider

floorZ = 0
z = 0
hspd = 0
vspd = 0
zspd = 0
fric = 4            //% per second
accel = 4           //% max speed gained per second of acceleration

canMove = true      //Can move check
canAttack = true    //Can attack check

dodgeCost = 2
dodgeSpeed = 30
dodgeTimer = 0

//Animations
animIndex[0] = humanoidWalk    //Current animation (For Legs+Body)
animStep[0] = 0     //Current animation step
animDelay[0] = 0    //How many seconds to next step
animSpeed[0] = 1    //Multiplier for animation speed (can be negative)

animIndex[1] = weaponIdle    //Right Hand
animStep[1] = 0     
animDelay[1] = 1    
animSpeed[1] = 1    

animIndex[2] = weaponIdle    //Left Hand
animStep[2] = 0     
animDelay[2] = 1    
animSpeed[2] = 1    

bodyTwist = 0
greatWeapon = false

//Targeting Essentials
targetX = x
targetY = y

vFacing = 0
hFacing = 1
facing = 0

turnSpeed = 360     //Degrees/second

//Control Script
pc = false
controlScript = playerControl       //Temp, replace with ai control

//Vitals
life = 12
lifeMax = 12
lifeRegen = 0.0 //per second

stam = 4
stamMax = 4    
stamRegen = 2.0   //per second
stamDelay = 0.0

//Character stats
stealth = 1

//Fighting
hold[1] = 0
hold[2] = 0
charge[1] = 0
charge[2] = 0
meleeSwing[1] = 1
meleeSwing[2] = -1
queuedAnim[1] = -4
queuedAnim[2] = -4
sweetSpot = false
fumble = false

//Inventory
inventorySize = 10
for(i = 0; i < inventorySize; i++)
{
    inventory[i] = noone
}
handItem[1] = noone
handItemSlot[1] = -1
handItem[2] = noone
handItemSlot[2] = -1

hoverItem = 0
pointInteract = noone



#define charStep
//Execute Control Script
script_execute(controlScript)

//Facing
facing = rotate(facing,point_direction(x,y,targetX,targetY),turnSpeed/global.frameRate)

//Movement
moveStep()
moveLimit()
isoDepth(0)

/*
script_execute(control)
charFacing()

/*
if hp > hpMax
{
    hp = hpMax
}

if spDelay = 0
{
    sp = min(spMax,sp+(spRegen/global.frameRate))
}
else
{
    spDelay = max(0,spDelay-(1/global.frameRate))
}

if pc = true
{
    fire = min(100,fire+(2/global.frameRate))
}

if canAttack = true
{
    kick = max(0,kick-(10/global.frameRate))
}

kick = min(10,kick)

if hp <= 0
{
    if pc = true
    {
        room_speed = global.frameRate/2
        obj_control.black += .5/global.frameRate
        canMove = false
        canAttack = false
        
        if vis = true
        {
        obj_control.black = 0
        i = instance_create(x,y,obj_corpse)
        i.hspd = hspd
        i.vspd = vspd
        i.zspd = zspd
        i.facingH = facingH
        i.facingV = facingV
        with(i){scr_humanoid(0)}
        i.charSprite = charSprite
        i.anim[0] = scr_humanoidDeath
        i.anim[1] = scr_swordIdle
        i.alarm[0] = 1
        i.alarm[1] = -4
        
        vis = false
            if instance_exists(invSlot[invSelect])
            {
                with(invSlot[invSelect])
                {
                scr_dropItem()
                }
            }
        }
    }
    else
    {
        audio_play_sound(deathSound,0,false)
    
        i = instance_create(x,y,obj_corpse)
        i.hspd = hspd
        i.vspd = vspd
        i.zspd = zspd
        i.facingH = facingH
        i.facingV = facingV
        with(i){scr_humanoid(0)}
        i.charSprite = charSprite
        i.anim[0] = scr_humanoidDeath
        i.alarm[0] = 1

        repeat(arrows)
        {
            instance_create(x-5+random(10),y-5+random(10),obj_arrowPickup)
        }
        
        instance_destroy()
        

    }
}

//Set Terrain to whatever the Grid Tile is (add exception for spots)
dTerrain = grid.difficult

#define charEndstep
//Animate
animEndStep(0)
animEndStep(1)
animEndStep(2)

//Animation Control (clean up and move somewhere else)
if canMove = true
{
    if moving != 0
    {
        animIndex[0] = humanoidWalk
    }
    else
    {
        if animIndex[0] != humanoidIdle
        {
            animationStart(humanoidIdle,0)
        }
    }
}

//Misc Timers
if dodgeTimer > 0
{
    dodgeTimer -= 1/global.frameRate
    
    if dodgeTimer <= 0
    {
        dodgeTimer = 0
        canMove = true
    }
}

//Stamina Regeneration
if stamDelay = 0
{
    stam = min(stamMax,stam+(stamRegen/global.frameRate))
}
else
{
    stamDelay = max(0,stamDelay-(1/global.frameRate))
}

#define charDestroy
//Clear the drawing surface
surface_free(charSurf)

#define charDraw
//Draw Character
if animUpdate = true
{
    script_execute(animType,1)
    animUpdate = true   //switch to false after
}

draw_surface_ext(charSurf,round(x-(charSurfSize*.5)),round(y-(charSurfSize*.75)),1,1,0,c_white,1)

/*Temp just draw random stuff
draw_set_colour(c_white)
draw_rectangle(round(x)-4,round(y)-16,round(x)+4,round(y),false)
draw_text(round(x),round(y)+20,global.frameRate)
draw_text(round(x),round(y)+30,moving*global.frameRate/metre)
