#define aiAttackPattern
if (attackStep != 0){
    attackPatternStep()
}
else{
    attackPatternStart(attackPattern)
}



#define attackPatternStart
attackStep = 0
attackIndex= argument0
script_execute(attackIndex,attackStep)

#define attackPatternStep
script_execute(attackIndex,attackStep)

#define attackReset
attackPattern = attackIdle
attackStep = 0

#define attackIdle

#define attackDodgeStep

switch(argument0)
{
    case 0:
        
    break

    case 1:
   
    break
    
    case 2:
    
    break
    
    case 3:
    
    break
    
    case 4:
    
    break
    
    case 5:
    
    break
    
    case 10:
        var moveT = (movement*moveMult)
        moveT = moveT/(1+moveDT)
        
        hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
        
        
        dodgeRoll(facing +30 + random(300))  
    break
    
    case 28:
        attackReset()
    break
}

if (attackPattern != attackIdle){
    attackStep++
}


/*
var moveT = (movement*moveMult)
moveT = moveT/(1+moveDT)

hspd = -lengthdir_x(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))
vspd = -lengthdir_y(moveT,point_direction(x,y,actionTargetId.x,actionTargetId.y))


dodgeRoll(facing +30 + random(300))