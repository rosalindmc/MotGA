//Bow Idle Script
alarm[1] = 1

if arrows > 0
{
    itemImage = 0
}
else
{
    itemImage = 1
}

itemDist = 12
itemDir = (round(facing/15)*15)-(45*facingH)
itemHeight = hipsHeight+1-hipsBounce
itemRot = (round(facing/15)*15)-(45*facingH)
