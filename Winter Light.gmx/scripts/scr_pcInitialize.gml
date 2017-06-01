//PC
pc = 1
global.pc = id
control = scr_playerControl
fire = 100
team = 1

i = instance_create(x,y,obj_itemCarried)
i.itemType = item_knife
i.owner = id
i.slot = 1
invSlot[1] = i

arrows = 0
