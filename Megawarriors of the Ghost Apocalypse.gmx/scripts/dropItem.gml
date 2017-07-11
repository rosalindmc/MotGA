#define dropItem
//remove item from relevent slot
//make an interactable for object
//item loses owner


if handItem[argument0] != noone
{
    handItem[argument0].owner = noone
    i = instance_create(x,y,obj_interactable)
    i.owner = handItem[argument0]
    i.name = handItem[argument0].name
    i.useType = pickUp
    handItem[argument0].interactId = i
    handItem[argument0] = noone
}

#define throwItem
//remove item from relevent slot
//make an interactable for object
//item loses owner

switch(argument1)
{
    case 0:
    break
    case 1:
    break
}

if handItem[argument0] != noone
{
    handItem[argument0].owner = noone
    i = instance_create(x,y,obj_interactable)
    i.owner = handItem[argument0]
    i.name = handItem[argument0].name
    i.useType = pickUp
    handItem[argument0].interactId = i
    handItem[argument0] = noone
}
