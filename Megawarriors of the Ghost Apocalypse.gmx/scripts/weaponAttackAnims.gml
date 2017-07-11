#define weaponAttackAnims


#define weaponIdle
animDelay[argument1] = 1
animSpeed[argument1] = 1

handDir[argument1] = 15*meleeSwing[argument1]
itemRot[argument1] = 30*meleeSwing[argument1]



#define weaponHold
switch(argument0)
{
    case 0:
    handDist[argument1] = 4
    handDir[argument1] = (45*meleeSwing[argument1])
    handHeight[argument1] = 2
    itemRot[argument1] = 0
    animDelay[argument1] = .3
    break

}



#define weaponSlash

#define weaponStab

#define weaponHilt

#define throwHold


#define throwAnim
