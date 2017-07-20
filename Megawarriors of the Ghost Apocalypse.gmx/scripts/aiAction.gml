#define aiAction
script_execute(currentAction,2)

#define actionIdle
//argument0 is the check/set order/run switch
switch (argument0){
case 0:
    return 1;
    break;
    
case 1:
    currentAction = 'actionIdle'
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
        return 1;
    }
    else{
        actionTargetX = x + random(2) - 1
        actionTargetY = y + random(2) - 1          
        
        return 0;  
    }
    
    break;
    
case 1:
    currentAction = 'actionMove'
    break;
    
case 2:
    
    if (facing != point_direction(x,y,actionTargetX,actionTargetY)){
        facing = rotate(facing,point_direction(x,y,actionTargetX,actionTargetY),turnSpeed/global.frameRate)        
    }
    
    var moveT = (movement*moveMult)
    moveT = moveT/(1+moveDT)
    
    hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetX,actionTargetY))
    vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetX,actionTargetY))

    actionTargetX=0    
    
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
    if(actionTargetId != noone){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else{
        actionTargetId = global.player 
        
        return 0;           
    }
    
    break;
    
case 1:
    currentAction = 'actionChase'
    break;
    
case 2:
    
    if (facing != point_direction(x,y,actionTargetX,actionTargetY)){
        facing = rotate(facing,point_direction(x,y,actionTargetId.x,actionTargetId.y),turnSpeed/global.frameRate)        
    }
    
    var moveT = (movement*moveMult)
    moveT = moveT/(1+moveDT)
    
    hspd = lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
    vspd = lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))

    
    actionTargetId = noone    
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
