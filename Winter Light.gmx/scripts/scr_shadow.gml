//Movement
movement = 20
fric = 1
accel = .1

//Combat
turnSpeed = 6

//Vital
hp = 4+choose(1,2)
hpMax = hp
sp = 8
spMax = 8
spRegen = 3

//Ai
team = 3
ai[0] = findWeapon
ai[1] = attack
ai[2] = idle

//Visuals
charSprite = choose(spr_shade,spr_imp)
blood = obj_blackBlood
canBleed = true
deathSound = snd_shadowDeath

//Item
i = instance_create(x,y,obj_item)
    if i.itemType = item_bow
    {
        repeat(1+irandom(3)+irandom(3))
        {
            instance_create(x-5+random(10),y-5+random(10),obj_arrowPickup)
        }
    }
