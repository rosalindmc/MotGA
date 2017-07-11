//pickUp(character)
//REMINDER this script is run by the interact flag
for(i = 0; i < inventorySize; i++)
{
    if argument0.inventory[i] = noone
    {
        if argument0.handItem = noone
        {
            owner.hand = 1
            argument0.handItem = owner
        }
        
        owner.owner = argument0
        instance_destroy()
        break
    }
}
