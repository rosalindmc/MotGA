#define char


#define charInitialize
//Movement Essentials
movement = 5        //Metres per second
moveMult = 1        //Malleable multiplier for movement speed
moveDT = 0          //Difficult terrain divider

hspd = 0
vspd = 0
zspd = 0
fric = 5            //Metres per second
accel = 1           //% max speed gained per second of acceleration

canMove = true      //Can move check
canAttack = true    //Can attack check

//Targeting Essentials
targetX = x
targetY = y

facingV = 0
facingH = 1
facing = 0

turnSpeed = 1

//Control Script
pc = false
controlScript = playerControl       //Temp, replace with ai control

#define charStep
//Execute Control Script
script_execute(controlScript)

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
//Movement
moveLimit()
moveStep()
isoDepth(0)

#define charDestroy

#define charDraw
draw_sprite(spr_reticle,0,x,y)
draw_set_colour(c_white)
draw_text(x,y+10,x)
draw_text(x,y+20,y)
draw_text(x,y+30,hspd)
draw_text(x,y+40,vspd)

