#define aiAction


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
//argument0 is the check/set order/run switch
switch (argument0){
case 0:
    if(actionTargetX !=0 && actionTargetY != 0){
        //pathFind to the spot and check if you can get there
        return 1;
    }
    else(){
        
        return 1;
    }
    
    break;
    
case 1:
    currentAction = 'actionMove'
    break;
    
case 2:
    break;
}

#define actionInteract

#define actionAttack

#define actionAttackTarget

#define actionPatrol

#define actionChase

#define actionChaseAlert

#define actionCover

#define actionHide

#define actionFollowOrders

#define actionLeaderAttack
