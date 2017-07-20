#define hitCollider


#define hitColliderInitialize
danger = true

/*scr_projectile_initialize()
colour = c_white
image_speed = 0
image_alpha = 1

alarm[0] = 1
depth = -y

audio_play_sound(snd_swing,0,false)

#define hitColliderCollisionChar
if danger = true
{
    other.life -= dmg

    //Impact
    other.hspd += lengthdir_x(impact,point_direction(originX,originY,other.x,other.y))
    other.vspd += lengthdir_y(impact,point_direction(originX,originY,other.x,other.y))
    other.moveTimer += .2
    other.canMove = false
    
    if owner.player = true or other.player = true
    {
        obj_control.shake += impact
    }
}

#define hitColliderCollisionTerrain

#define hitColliderDraw



//draw this collider
#define hitColliderStep
