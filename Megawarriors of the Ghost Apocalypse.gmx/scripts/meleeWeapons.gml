#define meleeWeapons

#define sword
switch(argument0)
{
    case 0:     //Initialize 
    //Core
    name = choose('Sword','Item','Steve','Harvy','Todd','Howard')
    sprite_index = spr_sword
    useScript[1] = melee
    useScript[2] = melee
    
    //Item Stats
    length = 12
    
    //Weapon Stats
    meleePow = 1
    meleeRate = 1
    meleeImpact = 1
    meleeLunge = 1
    meleeSlow = .5
    meleeSize = 1
    meleeCost = 1
    
    throwPow = 1
    throwRate = 1
    throwImpact = 1
    throwLunge = 0
    throwSpeed = 30
    throwSpin = 0
    throwCost = 1
    
    anim[0] = weaponIdle    //Idle Anim
    anim[1] = weaponSlash   //Basic Attack
    anim[2] = weaponSlash   //Power Attack
    anim[3] = weaponSlash   //Alternate Attack (2h)
    anim[4] = weaponStab    //Roll Attack
    anim[5] = weaponHilt    //Close attack    
    anim[6] = weaponHilt    //Special Slot, called by some items
    anim[7] = throwHold     //Throw
    
    for(i = 1; i < 7; i++)
    {
        meleePowMult[i] = 1
        meleeRateMulte[i] = 1
        meleeImpactMult[i] = 1
        meleeLungeMult[i] = 1
        meleeSlowMult[i] = 1
        meleeSizeMult[i] = 1
        meleeCoseMulte[i] = 1
    }
    break
}
