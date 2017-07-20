#define aiAction
script_execute(currentAction,2)

#define actionIdle
//argument0 is the check/set order/run switch
switch (argument0){
case 0:
    return 1;
    break;
    
case 1:
    currentAction = actionIdle
    break;
    
case 2:
    break;
}

#define actionMove
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    if(actionTargetX !=0 && actionTargetY != 0){
        //pathFind to the spot and check if you can get there
        actionTargetX = ceil(x + irandom(4*metre) - 2*metre)
        actionTargetY = ceil(y + irandom(4*metre) - 2*metre)
        
        return 1;
    }
    else{
        actionTargetX = ceil(x + irandom(4*metre) - 2*metre)
        actionTargetY = ceil(y + irandom(4*metre) - 2*metre)  
             
        
        return 0;  
    }
    
    break;
    
case 1:
    currentAction = actionMove
    break;
    
case 2:

    
    if(point_direction(x,y,actionTargetX,actionTargetY) > 1*metre && canMove = true){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetX,actionTargetY))
        vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetX,actionTargetY))
        
         
    }
    
    targetX = actionTargetX
    targetY = actionTargetY
    
    break;
}

#define actionDistance
//argument0 is the check/set order/run switch
switch (argument0){
case 0:
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 4*metre /*&& (life < lifeMax/2 || stam < stamMax/2)*/){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else{
        actionTargetId = global.pc
        return 0;
    }
    break;
    
case 1:
    currentAction = actionDistance
    break;
    
case 2:

    if (canMove){
    if(actionTargetId.charge[1]>1 || actionTargetId.charge[2]>1){
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        
        targetX = actionTargetId.x - hspd*2
        targetY = actionTargetId.y - vspd*2
        
        dodgeRoll(facing)
    }
    else{
    var moveT = (movement*moveMult)
    moveT = moveT/(1+moveDT)
    
    if (point_distance(x,y,actionTargetId.x,actionTargetId.y)<3*metre){
    
    hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    
    }
    }

    targetX = actionTargetId.x
    targetY = actionTargetId.y
    }
    break;
}

#define actionInteract

#define actionAttack

#define actionAttackTarget

#define actionPatrol

#define actionChase
/*
argument0 is the check/set order/run switch

*/
switch (argument0){
case 0:
    if(actionTargetId != noone && point_distance(x,y,actionTargetId.x,actionTargetId.y) < 10*metre){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else{
        actionTargetId = global.pc
        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = actionChase
    break;
    
case 2:

    if (canMove){
    var moveT = (movement*moveMult)
    moveT = moveT/(1+moveDT)
    
    hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    
    }

    targetX = actionTargetId.x
    targetY = actionTargetId.y   
    
    break;
}

#define actionChaseAlert

#define actionCover

#define actionHide

#define actionSearch

#define actionFollowOrders

#define actionOrderAttack

#define actionOrderFormation

#define actionOrderGuard

#define actionOrderSearch

