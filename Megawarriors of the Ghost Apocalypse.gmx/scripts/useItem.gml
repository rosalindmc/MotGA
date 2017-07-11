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
switch(argument0)
{
case 0:     //Click
show_message('Melee Click')
//check if you can swing
//can attack? at least 1 stamina? not alreayd holding an attack?
//check range and context and run appropriate hold anim
break

case 1:     //Release
//check if charging an attack
//execute attack animation corresponding to hold animation
break
}
