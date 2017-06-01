#define scr_aiControl
//AI follows series of codes in order
//If AI can't complete current code, it falls onto the next one

//Random Chance to reevaluate
if random(100) < 100/global.frameRate
{
    evaluate()
}

//Perform Current Order
script_execute(aiOrder,1)

personalSpace()


#define findWeapon
switch(argument0)
{
case 0:     //Assigning/evaluating orders

//Check if has a weapon Equipped
i = 0
if invSlot[invSelect] != -4
{
    if invSlot[invSelect].itemClass = 'Weapon'
    {
        i = 1
    }
}


//If so: skip step, if not: begin Search
if i = 1
{  
    aiStep += 1
    script_execute(ai[aiStep],0)
}
else
{
global.dist = 1000
global.i = -4
    with(obj_item)
    {
        if itemClass = 'Weapon'
        {
            if point_distance(x,y,other.x,other.y) < global.dist
            {
                global.i = id
                global.dist = point_distance(x,y,other.x,other.y) 
            }
        }
    }

//If Found a Viable item
if global.i != -4
{
    orderX = global.i.x
    orderY = global.i.y
    orderTarget = global.i
    aiOrder = findWeapon
    orderDes = 'Searching for Weapon'
}
else
{
    aiOrder = idle   
    orderDes = 'Idle'
}
}
break

case 1:     //Executing orders
if instance_exists(orderTarget)
{
    if distance_to_object(orderTarget) > 30
    {
        aiMove()
    }
    else
    {
        pointerInteract = orderTarget
        scr_interact()
        
        evaluate()
    }
}
else
{
    evaluate()
}
break
}

#define attack
switch(argument0)
{
case 0:     //Assigning/evaluating orders
global.dist = 1000
global.i = -4
    with(obj_char)
    {
        if team != other.team
        {
        if !collision_line(x,y,other.x+lengthdir_x(10,point_direction(other.x,other.y,x,y)),other.y+lengthdir_y(10,point_direction(other.x,other.y,x,y)),obj_terrain,false,true)
        {
            if point_distance(x,y,other.x,other.y) < global.dist
            {
                global.i = id
                global.dist = point_distance(x,y,other.x,other.y) 
            }
        }
        }
    }

//If found a viable foe
if global.i != -4
{
    orderX = global.i.x
    orderY = global.i.y
    orderTarget = global.i
    aiOrder = attack
    orderDes = 'Attacking '+string(global.i)
}
else
{
    aiStep += 1
    script_execute(ai[aiStep],0)  
}
break

case 1:     //Executing orders
if instance_exists(orderTarget)
{
    if !collision_line(x,y,orderTarget.x+lengthdir_x(10,point_direction(orderTarget.x,orderTarget.y,x,y)),orderTarget.y+lengthdir_y(10,point_direction(orderTarget.x,orderTarget.y,x,y)),obj_terrain,false,true)
    {
        if invSlot[invSelect] != -4 
        {   
        iR = point_distance(x,y,orderTarget.x,orderTarget.y)
        
            //Move to Attack
            if iR > invSlot[invSelect].aiMaxRange*metre
            {
                orderX = orderTarget.x
                orderY = orderTarget.y
                aiMove()
            }
            else
            {
                //Back Off if too Close
                if iR < invSlot[invSelect].aiMinRange*metre
                {
                    orderX = orderTarget.x+lengthdir_x(invSlot[invSelect].aiMinRange*metre,point_direction(orderTarget.x,orderTarget.y,x,y))
                    orderY = orderTarget.y+lengthdir_y(invSlot[invSelect].aiMinRange*metre,point_direction(orderTarget.x,orderTarget.y,x,y))
                    aiMove()
                }
            
                targetX = orderTarget.x
                targetY = orderTarget.y
                
                if random(global.frameRate) < 2
                {
                    if (sweetSpot = true or canAttack = true and hold = 0)
                    {
                        with(invSlot[invSelect])
                        {
                            script_execute(use[1],1)
                        }
                    }
                    
                    if hold = 1 and sweetSpot = true
                    {
                        with(invSlot[invSelect])
                        {
                            script_execute(use[1],2)
                        }
                    }
                    else if sweetSpot = true
                    {
                        with(invSlot[invSelect])
                        {
                            script_execute(use[1],1)
                            script_execute(use[1],2)
                        }
                    }
                }
            }
        }
    }
    else
    {
        aiMove()
    }
}
else
{
    evaluate()
}
break
}

#define patrol

#define idle
//Do Nothing


#define evaluate
//Set to Idle state
aiOrder = idle   
orderDes = 'Idle'

//New Orders
aiStep = 0
script_execute(ai[aiStep],0)

#define aiMove
var moveT = (metre*movement*moveMult)/global.frameRate

moveT = moveT/dTerrain

if canMove = true and grounded = true
{
targetX = orderX
targetY = orderY

//If you can move directly, do that
//if !collision_line(x,y,orderX,orderY,obj_terrain,false,true)
//{
    //Horizontal Movement
    if orderX+2 < x
    {
        hspd = max(-moveT,hspd-(moveT*accel))
    }
    else if orderX-2 > x
    {
        hspd = min(moveT,hspd+(moveT*accel))
    }
    
    //Vertical Movement
    if orderY+2 < y
    {
        vspd = max(-moveT,vspd-(moveT*accel))
    }
    else if orderY-2 > y
    {
        vspd = min(moveT,vspd+(moveT*accel))
    }

    hspd = lengthdir_x(min(moveT,point_distance(0,0,hspd,vspd)),point_direction(0,0,hspd,vspd))
    vspd = lengthdir_y(min(moveT,point_distance(0,0,hspd,vspd)),point_direction(0,0,hspd,vspd))
}

//Otherwise, get complicated

//}

#define personalSpace
ii = 0
repeat(8)
{
ii += 45
if collision_point(x+lengthdir_x(10,ii),y+lengthdir_y(10,ii),obj_hitBlock,false,true)
{
    hspd += lengthdir_x(50/global.frameRate,ii+180)
    vspd += lengthdir_y(50/global.frameRate,ii+180)
}
}