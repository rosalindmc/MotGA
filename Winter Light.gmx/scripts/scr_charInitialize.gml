//Movement
movement = 10
hspd = 0
vspd = 0
zspd = 0
fric = 1
accel = .3

//Vital
hp = 20
hpMax = 20
sp = 8
spMax = 8
spRegen = 4
spDelay = 0
arm = 0

//Melee Combat
meleeCharge = 0
sweetSpot = false
meleeSwing = 1
fumble = 0
strike = 0
hold = 0

//Core
canAct = true
canAttack = true
canMove = true
moving = false
moveMult = 1

targetX = x
targetY = y

pointx = 0
pointy = 0
pointerInteract = -4
myPath = path_add()
pc = 0
h = 0
fh = 0
targetH = h+20
grounded = true
dTerrain = 1
grid = -4
control = scr_aiControl
team = 2
ai[0] = findWeapon
ai[1] = attack
ai[2] = idle
aiStep = 1
aiOrder = idle
orderX = x
orderY = y
orderTarget = -4
orderDes = 'Idle'

//Visual
script_execute(scr_humanoid, 0)
facing = 0
facingV = 0
facingH = 0 
vis = true

//Inventory
invSelect = 1
i = 1
repeat(6)
{
    invSlot[i] = -4
    i += 1
}

//Item Stats
itemImage = 0
itemDist = 4
itemDir = 0
itemHeight = 20
itemRot = 0
arrows = 0

//Combat
turnSpeed = 5
kick = 0
dodgeCost = 2
dodgeSpeed = 25
