//pickUp(character)
//REMINDER this script is run by the interact flag
for(i = 0; i < argument0.inventorySize; i++)
{
    if argument0.inventory[i] = noone
    {
        if argument0.handItem[1] = noone
        {
            show_message('pickup')
            owner.hand = 1
            argument0.handItemSlot[1] = i
            argument0.handItem[1] = owner
        }
        
        argument0.inventory[i] = owner
        owner.owner = argument0
        instance_destroy()
        break
    }
}
