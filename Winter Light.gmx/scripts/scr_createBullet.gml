
i = instance_create(x+lengthdir_x(bLength,image_angle),y+lengthdir_y(bLength,image_angle),projectile)

i.h = h
i.dmg = bulletDmg*owner.meleeCharge
i.impact = bulletImpact*owner.meleeCharge
i.spd = (bulletSpd*metre*(.9+random(.2)))/global.frameRate
i.owner = owner
i.attacker = owner
i.dmgType = bulletType
i.image_angle = image_angle
i.direction = point_direction(owner.x,owner.y,owner.targetX,owner.targetY)
