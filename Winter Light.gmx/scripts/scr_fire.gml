//Fire Weapon
with(invSlot[invSelect])
{
    scr_createBullet()
    
    if muzzleFlash != -4
    {
        scr_ejectCasing()
        scr_muzzleFlash()
    }
}
