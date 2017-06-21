//Establish Friction
if canMove = true
{
    f = (movement*fric*moveMult/(1+moveDT))
}
else
{
    f = (movement*fric)
}

//Apply Friction
if hspd > 0 
{
    hspd = max(hspd-(f/global.frameRate),0)
}
else
{
    hspd = min(hspd+(f/global.frameRate),0)
}

if vspd > 0
{
    vspd = max(vspd-(f/global.frameRate),0)
}
else
{
    vspd = min(vspd+(f/global.frameRate),0)
}
