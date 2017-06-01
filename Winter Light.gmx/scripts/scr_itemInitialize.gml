//Game Variables
use[1] = scr_fire
use[2] = scr_melee

//Particle System
ps1 = part_system_create()
pt1 = part_type_create()
ps1 = part_emitter_create(ps1)

//Core
owner = -4      //Who is carrying this item
h = 0           //Height of item
fric = 0
spd = random(metre)/global.frameRate
itemHilt = 0
name = 'none'
itemType = choose(item_sword,item_axe,item_mace,item_spear,item_bow)
itemClass = 'Weapon'
muzzleFlash = spr_muzzle
projectile = obj_bullet
sword = false
bow = false
bulletType = 'piercing'
bulletSpd = 0
bulletDmg = 0
bulletImpact = 20
bulletStr = false
fireRate = 1
meleeRate = 1
meleeDmg = 4
meleeType = 'rending'
meleeSize = 1
meleeSlow = .3
meleeLunge = 8
meleeImpact = 8
throwRate = 1
throwDmg = 2
throwImpact = 5
throwType = 'impact'
throwSpd = 40
throwCost = 2
throwSpin = 0
aiMinRange = 1.5
aiMaxRange = 2
bLength = 0
centerAdj = 0
length = 0
facing = 0
grid = collision_point(x,y,obj_grid,false,false)
harm = false

anim[0] = scr_swordIdle
anim[1] = scr_swordSlash
anim[2] = scr_swordSlash
anim[3] = scr_swordSlash
anim[4] = scr_swordHold
anim[5] = scr_throwHold

image_index = spr_none

alarm[0] = 2

switch(argument0)
{
case 1: //Ground only variable
h = 0
grounded = true
zspd = 0
iSpin = 0
image_angle = random(360)
useType = scr_equip //How item is interacted with when on the ground
image_speed = 0
break
case 2: //Carry only variables
slot = 0
inHand = false
break
}
