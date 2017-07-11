#define useItem
//Run the use script of the item in hand argument0
//Run the second use script if right clicking w/ two hands
//Input argument 1 to script for press vs release

#define melee
switch(argument0)
{
case 0:     //Click
//check if you can swing
//can attack? at least 1 stamina? not alreayd holding an attack?
//check range and context and run appropriate hold anim
break

case 1:     //Release
//check if charging an attack
//execute attack animation corresponding to hold animation
break
}
