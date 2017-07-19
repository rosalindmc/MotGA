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
    if canAttack = true and (charge[min(argument0,2-greatWeapon)] = 0 or (sweetSpot = true and fumble = false)) and stam >= 1
    {
        //Begin Hold
        charge[min(argument0,2-greatWeapon)] = 1
        fumble = false
        hold[min(argument0,2-greatWeapon)] = 1
        stamDelay = max(stamDelay,1)
        
        //Combo Flip
        if sweetSpot = true
        {
            meleeSwing[min(argument0,2-greatWeapon)] *= -1
        }
        
        //Start Hold Animation as determined by weapon and context
        if argument0 = 2 and greatWeapon = true
        {
            //Alt Attack
            queuedAnim[1] = 3
            animationStart(handItem[1].animHold[1],1)
        }
        else if recentDodge != 0 or dodgeTimer != 0
        {
            //Roll Attack
            queuedAnim[argument0] = 4
            animationStart(handItem[argument0].animHold[2],argument0)
        }
        else if point_distance(x,y,targetX,targetY) < handItem[argument0].length+10 //Replace with var
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
    }
    else
    {
        fumble = true
    }
    break
    
    case 1:     //Release
    if hold[min(argument0,2-greatWeapon)] != 0 and canAttack = true
    {
        //Play corresponding attack anim   
        meleeAttack(min(argument0,2-greatWeapon))     
    }
    break
}

#define meleeAttack
//Play relevent animation
//Set Stamina Delay
//Spend Stamina

//Stamina Cost
spendStamina(handItem[argument0].meleeCost*handItem[argument0].meleeCostMult[queuedAnim[argument0]]/(1+(sweetSpot*perfectTimeMod)),1)

//Anim and Essentials
sweetSpot = false
strike[argument0] = 1
hold[argument0] = 0
animationStart(handItem[argument0].anim[queuedAnim[argument0]],argument0)

//Add Lunge animations

//Lunge


#define meleeHit
// Make melee collider
strike[argument0] = 0
with(handItem[argument0])
{    
    i = instance_create(owner.x+lengthdir_x(length+owner.handDist[argument0],owner.facing),owner.y+lengthdir_y(length+owner.handDist[argument0],owner.facing),obj_meleeCollider)
    i.owner = owner
    i.dist = (length/2)+owner.handDist[argument0]+holdPoint
    i.image_angle = owner.facing
    i.dmg = meleePow*meleePowMult[argument1]*(1+((owner.charge[argument0]-1)*meleeChargePowMult[argument1]))
    i.impact = meleeImpact*meleeImpactMult[argument1]*owner.charge[argument0]
    i.z = z
    i.dmgType = meleeType[argument1]
    i.sprite_index = meleeAttackMask[argument1]
    i.image_yscale = meleeSize*meleeSizeMult[argument1]*owner.meleeSwing[argument0]
    i.image_xscale = meleeSize*meleeSizeMult[argument1]
}

#define meleeEnd
charge[argument0] = 0
animationReset(argument0)
<<<<<<< HEAD

#define perfectHitSheen
if fumble = false
{
    with(handItem[argument0])
    {    
        i = instance_create(owner.x+lengthdir_x(length+owner.handDist[argument0],image_angle),owner.y+lengthdir_y(length+owner.handDist[argument0],image_angle),obj_particle)
        i.z = z
    }
}
=======
>>>>>>> origin/master
