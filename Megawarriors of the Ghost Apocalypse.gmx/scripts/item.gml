#define item

#define itemInitialize
hand = 0            //0 = inInventory, 1/2 equal corresponding hand
owner = noone       //Who currently owns/wields this item

sprite = spr_sword
hand1Pos = 0
hand2Pos = 0

hspd = 0
vspd = 0
zspd = 0
floorZ = 0
z = 0
spin = 0


#define itemStep
if owner != noone
{
    //Resolve Owned
    if instance_exists(owner)
    {
        
    }
}
else
{
    //Resolve Unowned
    image_angle += spin/global.frameRate
    moveStepObject()
}

#define itemDraw
