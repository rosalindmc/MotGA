#define scr_ranged


#define scr_rangedEnd
//Finnish Attack Animation
if instance_exists(invSlot[invSelect])
{
    anim[1] = invSlot[invSelect].anim[0]
}
animStep[1] = 0
canAttack = true
meleeCharge = 0
spDelay = 0
moveMult = 1