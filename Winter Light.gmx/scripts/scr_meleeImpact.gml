#define scr_meleeImpact
if other.id != owner and instance_exists(owner)
{
    if owner = global.pc or other = global.pc
    {
      obj_camera.shake += impact
    }
    
    //Check Clash
    if other.strike = 1
    {
        audio_play_sound(snd_clang,0,false)
        other.anim[1] = scr_weaponRecoil
        other.animStep[1] = 0
        other.alarm[1] = 1
        
        other.hspd += lengthdir_x(metre*15/global.frameRate,point_direction(owner.x,owner.y,other.x,other.y))
        other.vspd += lengthdir_y(metre*15/global.frameRate,point_direction(owner.x,owner.y,other.x,other.y))
        
        owner.anim[1] = scr_weaponRecoil
        owner.animStep[1] = 0
        owner.alarm[1] = 1
        other.strike = 0
        
        owner.hspd += lengthdir_x(metre*15/global.frameRate,point_direction(other.x,other.y,owner.x,owner.y))
        owner.vspd += lengthdir_y(metre*15/global.frameRate,point_direction(other.x,other.y,owner.x,owner.y))
        
        repeat(25)
        {
            i = instance_create(x,y,obj_spark)
            i.h = h
        }
    }
    else
    {
    //Meat Hit
    other.hp -= dmg
    
    if dmgType = 'piercing' or dmgType = 'rending'
    {
        i = instance_create(x,y,obj_bleeding)
        i.owner = other
    }
    else if dmgType = 'impact'
    {
        i = instance_create(x,y,obj_stun)
        i.owner = other        
    }
    
    //Stagger
    other.hspd += lengthdir_x(metre*impact/global.frameRate,point_direction(owner.x,owner.y,other.x,other.y))
    other.vspd += lengthdir_y(metre*impact/global.frameRate,point_direction(owner.x,owner.y,other.x,other.y))
    other.canMove = false
    other.alarm[2] = (impact/30)*global.frameRate
    other.alarm[0] = 1
    
    if abs(angle_difference(other.facing,image_angle)) > 180
    {
    other.anim[0] = scr_humanoidFlinchForward
    }
    else
    {
    other.anim[0] = scr_humanoidFlinchBack
    }
    other.animStep[0] = 0 
    
    //Blood
    repeat(choose(4,5,6)*dmg)
    {
    i = instance_create(other.x,other.y,other.blood)
    if sprite_index = spr_stab
    {
        i.direction = image_angle-20+random(40)
        i.speed *= 2
    }
    else
    {
        i.direction = image_angle-(90*sign(image_yscale))-40+random(80)
    }
    i.h = h
    i.speed *= dmg
    }
    
    colour = c_red
    audio_play_sound(choose(snd_weaponHit,snd_weaponHit2),0,false)
    }
}

#define scr_rangedImpact

    if attacker = global.pc or other = global.pc
    {
      obj_camera.shake += impact
    }
    
    //Meat Hit
    other.hp -= dmg
    
    if dmgType = 'piercing' or dmgType = 'rending'
    {
        i = instance_create(x,y,obj_bleeding)
        i.owner = other
    }
    else if dmgType = 'impact'
    {
        i = instance_create(x,y,obj_stun)
        i.owner = other        
    }
    
    //Stagger
    other.hspd += lengthdir_x(metre*impact/global.frameRate,direction)
    other.vspd += lengthdir_y(metre*impact/global.frameRate,direction)
    other.canMove = false
    other.alarm[2] = (impact/30)*global.frameRate
    other.alarm[0] = 1
    
    if abs(angle_difference(other.facing,image_angle)) > 180
    {
        other.anim[0] = scr_humanoidFlinchForward
    }
    else
    {
        other.anim[0] = scr_humanoidFlinchBack
    }
    other.animStep[0] = 0 
    
    //Blood
    repeat(choose(4,5,6)*dmg)
    {
        i = instance_create(other.x,other.y,other.blood)
        i.direction = image_angle-20+random(40)
        i.speed *= 2
        i.h = h
        i.speed *= dmg
    }
    
    audio_play_sound(choose(snd_weaponHit,snd_weaponHit2),0,false)
    

#define scr_impactDoodad
ii = max(dmg-other.arm,0)
other.hp -= ii
    
audio_play_sound(choose(snd_impactTerrain,snd_impactTerrain2),0,false)

//Blood
repeat(5+(choose(1,2,3)*ii))
{
i = instance_create(x,y,other.blood)
if sprite_index = spr_stab
{
    i.direction = image_angle-20+random(40)
    i.speed *= 2
}
else
{
    i.direction = image_angle-(90*sign(image_yscale))-40+random(80)
}
i.h = h
i.speed *= dmg
}

if other.hp <= 0
{
    with(other)
    {
        instance_destroy()
    }
}