#define useItem
//Run the use script of the item in hand argument0
//Run the second use script if right clicking w/ two hands
//Input argument 1 to script for press vs release

if throwKey = true
{
    //Add Throw hold and charge later
    //Temp just drop
    throwItem(argument0,argument1)
}
else
{
    if handItem[argument0] != noone
    {
        script_execute(handItem[argument0].useScript[min(1+greatWeapon,argument0)],argument0,argument1)
    }
    else
    {
        //Add unarmed punch anim later
    }
}

#define melee
switch(argument1)
{
    case 0:     //Click
    if ((canAttack = true and hold[argument0] = 0) or (sweetSpot = true and fumble = false)) and stam >= 1
    {
        //Begin Hold
        charge[argument0] = 1
        fumble = false
        hold[argument0] = 1
        
        //Start Hold Animation as determined by weapon and context
        if argument0 = 2 and greatWeapon = true
        {
            //Alt Attack
            queuedAnim[argument0] = 3
            animationStart(handItem[argument0].animHold[1],argument0)
        }
        else if dodgeTimer != 0
        {
            //Roll Attack
            queuedAnim[argument0] = 4
            animationStart(handItem[argument0].animHold[2],argument0)
        }
        else if point_distance(x,y,targetX,targetY) < 10 //Replace with var
        {
            //Close Attack
            queuedAnim[argument0] = 5
            animationStart(handItem[argument0].animHold[3],argument0)
        }
        else
        {
            //Normal Attack
            queuedAnim[argument0] = 1
            animationStart(handItem[argument0].animHold[0],argument0)
        }
        
        //moveMult = min(1-handItem[argument0].meleeSlow)
        
        //if sweetSpot = true
        //{
        //    meleeSwing[argument0] *= -1
        //}
    }
    else
    {
        fumble = true
    }
    break
    
    case 1:     //Release
    if charge[argument0] != 0 and canAttack = true
    {
        //Play corresponding attack anim     
        meleeAttack(argument0)     
    }
    break
}

#define meleeAttack
//Play relevent animation
//Set Stamina Delay
//Spend Stamina

sweetSpot = false
hold[argument0] = 0
strike[argument0] = 1
animationStart(handItem[argument0].anim[queuedAnim[argument0]],argument0)

stam -= handItem[argument0].meleeCost*handItem[argument0].meleeCoseMult[queuedAnim[argument0]]
stamDelay = .1+abs(min(0,stam))
stam = max(stam,0)

//Add Lunge animations

//Lunge


#define meleeHit
// Make melee collider

if (strike = 1){
    strike = 0
    
    with (handItem[argument0]){
        
        i = instance_create(owner.x+lengthdir_x(length+handItem[argument0].itemDist,owner.facing),owner.y+lengthdir_y(length+handItem[argument0].itemDist,owner.facing),obj_meleeHit)
        i.owner = owner
        i.image_angle = owner.facing
        i.dmg = handItem[argument0].meleeDmg*owner.charge[argument0]
        i.impact = handItem[argument0].meleeImpact*owner.Charge[argument0]
        i.h = h
        i.dmgType = handItem[argument0].meleeType
        i.sprite_index = handItem[argument0].attackMask
        i.image_yscale = handItem[argument0].meleeSize*owner.meleeSwing    //fix this variable name please someone
        i.image_xscale = handItem[argument0].meleeSize
    }    
}

#define meleeEnd
charge[argument0] = 0
animationReset(argument0)

#define perfectHitSheen
