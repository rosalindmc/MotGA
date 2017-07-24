t = argument0

//Damage
t.life -= dmg

createParticle(t.x,t.y,z,floor(dmg),partBlood,point_direction(originX,originY,t.x,t.y))

//Impact
t.hspd += lengthdir_x(impact,point_direction(originX,originY,t.x,t.y))
t.vspd += lengthdir_y(impact,point_direction(originX,originY,t.x,t.y))
t.moveTimer += .2
t.canMove = false
t.stability -= impact

//Shake
if owner.player = true or t.player = true
{
    obj_control.shake += impact
}
