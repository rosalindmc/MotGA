#define item

#define createItem
//item creation requires special steps so instead of using create object
//you must use createItem(x,y,type,owner)

var i, ii;

i = instance_create(argument0,argument1,obj_item)
i.type = argument2
i.owner = argument3

with(i)
{
    script_execute(argument2,0)
}

if argument3 = noone
{
    ii = instance_create(i.x,i.y,obj_interactable)
    ii.name = i.name
    ii.owner = i
    ii.useType = pickUp
    i.interactId = ii
}

#define itemInitialize
hand = 0            //0 = inInventory, 1/2 equal corresponding hand
owner = noone       //Who currently owns/wields this item

type = sword
hand1Pos = 0
hand2Pos = 0

hspd = 0
vspd = 0
zspd = 0
floorZ = 0
z = 0
spin = 0

interactId = noone

#define itemStep
if owner != noone
{
    //Resolve Owned
    if instance_exists(owner)
    {
        if hand != 0
        {
            x = owner.handX[hand]+owner.x-(owner.charSurfSize*.5)
            y = owner.handY[hand]+owner.y-(owner.charSurfSize*.75)
            image_index = 0 
        }
    }
}
else
{
    //Resolve Unowned
    image_angle += spin/global.frameRate
    moveStepObject()
}

#define itemDraw
draw_sprite_ext(sprite_index,image_index,round(x),round(y-z),1,1,image_angle,c_white,1)