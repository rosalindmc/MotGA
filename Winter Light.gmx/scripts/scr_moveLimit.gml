//Establish Friction
if canMove = true
{
    f = (fric*metre*moveMult/dTerrain)/global.frameRate
}
else
{
    f = (fric*metre)/global.frameRate
}

//Apply Friction
if hspd > 0 
{
    hspd = max(hspd-(f),0)
}
else
{
    hspd = min(hspd+(f),0)
}

if vspd > 0
{
    vspd = max(vspd-(f),0)
}
else
{
    vspd = min(vspd+(f),0)
}
