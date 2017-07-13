#define weaponAttackAnims


#define weaponIdle
animDelay[argument1] = 1
animSpeed[argument1] = 1

handDirDest[argument1] = 15*meleeSwing[argument1]
itemRotDest[argument1] = 30*meleeSwing[argument1]



#define weaponHold
switch(argument0)
{
    case 0:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (135*meleeSwing[argument1])
    animDelay[argument1] = .1
    break

    case 1:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (150*meleeSwing[argument1])
    animDelay[argument1] = .7
    break

    case 2:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (135*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .2
    
    charge[argument1] = 2
    if queuedAnim[argument0] = 1
    {
        queuedAnim[argument0] = 2
    }
    sweetSpot = true
    break
    
    case 3:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (150*meleeSwing[argument1])
    handHeightDest[argument1] = 5
    itemRotDest[argument1] = (225*meleeSwing[argument1])
    animDelay[argument1] = .1
    
    sweetSpot = false
    break
    
    case 4:
    meleeAttack(argument1)
    break
}



#define weaponSlash
switch(argument0)
{
    case 0:
    handDistDest[argument1] = 4
    handDirDest[argument1] = (90*meleeSwing[argument1])
    handHeightDest[argument1] = 4
    itemRotDest[argument1] = (120*meleeSwing[argument1])
    animDelay[argument1] = .03
    break

    case 1:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (45*meleeSwing[argument1])
    handHeightDest[argument1] = 3
    itemRotDest[argument1] = (60*meleeSwing[argument1])
    animDelay[argument1] = .03
    break
    
    case 2:
    handDistDest[argument1] = 12
    handDirDest[argument1] = (-15*meleeSwing[argument1])
    handHeightDest[argument1] = 2
    itemRotDest[argument1] = (0*meleeSwing[argument1])
    animDelay[argument1] = .04
    //HIT
    break
    
    case 3:
    handDistDest[argument1] = 10
    handDirDest[argument1] = (-45*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-60*meleeSwing[argument1])
    animDelay[argument1] = .1
    break
    
    case 4:
    handDistDest[argument1] = 8
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 1
    itemRotDest[argument1] = (-75*meleeSwing[argument1])
    animDelay[argument1] = .3
    sweetSpot = true
    break
    
    case 5:
    handDistDest[argument1] = 6
    handDirDest[argument1] = (-60*meleeSwing[argument1])
    handHeightDest[argument1] = 0
    itemRotDest[argument1] = (-75*meleeSwing[argument1])
    animDelay[argument1] = .3
    sweetSpot = false
    break
    
    case 6:
    meleeEnd(argument1)
    break
}

#define weaponStab

#define weaponHilt

#define throwHold


#define throwAnim
