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
        
        //start Hold Animation as determined by weapon and context
        moveMult = min(1-handItem[argument0].useSlow)
        
        if sweetSpot = true
        {
            meleeSwing[argument0] *= -1
        }
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

//Add Lunge animations


#define meleeHit

#define perfectHitSheen
