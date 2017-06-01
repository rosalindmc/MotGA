//Script for drawing and updating rebindable keys
//scr_keyRebindButton(number,howtouse)
//1 establish, 2 click

switch(argument0)
{
case 0:if argument1 key = global.upKey else global.upKey = key break
case 1:if argument1 key = global.rightKey else global.rightKey = key break
case 2:if argument1 key = global.downKey else global.downKey = key break
case 3:if argument1 key = global.leftKey else global.leftKey = key break

case 4:if argument1 key = global.sprintKey else global.sprintKey = key break
case 5:if argument1 key = global.dodgeKey else global.dodgeKey = key break
case 6:if argument1 key = global.sneakKey else global.sneakKey = key break

case 7:if argument1 key = global.reloadKey else global.reloadKey = key break
case 8:if argument1 key = global.interactKey else global.interactKey = key break
case 9:if argument1 key = global.throwKey else global.throwKey = key break
case 10:if argument1 key = global.emptyKey else global.emptyKey = key break

case 11:if argument1 key = global.itemKey[1] 
else global.itemKey[1] = key break
case 12:if argument1 key = global.itemKey[2] 
else global.itemKey[2] = key break
case 13:if argument1 key = global.itemKey[3] 
else global.itemKey[3] = key break
case 14:if argument1 key = global.itemKey[4] 
else global.itemKey[4] = key break
case 15:if argument1 key = global.itemKey[5] 
else global.itemKey[5] = key break
case 16:if argument1 key = global.itemKey[6] 
else global.itemKey[6] = key break
case 17:if argument1 key = global.itemKey[7] 
else global.itemKey[7] = key break
case 18:if argument1 key = global.itemKey[8] 
else global.itemKey[8] = key break
case 19:if argument1 key = global.itemKey[9] 
else global.itemKey[9] = key break
case 20:if argument1 key = global.itemKey[10] 
else global.itemKey[10] = key break
}
