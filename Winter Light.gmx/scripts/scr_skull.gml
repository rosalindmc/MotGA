//Movement
movement = 10
fric = 1
accel = .2

//Combat
turnSpeed = 3

//Vital
hp = 8+choose(1,2,3,4)
hpMax = hp
sp = 4
spMax = 4
spRegen = 3

//Ai
team = 2
ai[0] = findWeapon
ai[1] = attack
ai[2] = idle

//Visuals
charSprite = choose(spr_skull,spr_frostSkull)
blood = obj_boneDust
canBleed = false
deathSound = snd_boneDeath

//Item
i = instance_create(x,y,obj_item)
    if i.itemType = item_bow
    {
        repeat(1+irandom(3)+irandom(3))
        {
            instance_create(x-5+random(10),y-5+random(10),obj_arrowPickup)
        }
    }
