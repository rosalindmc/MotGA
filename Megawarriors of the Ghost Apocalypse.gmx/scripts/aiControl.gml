#define aiControl


#define aiInitialize
/*
called by charCreate
*/


respoinceTime = 1 
aiMasterListGreen[0] = 0
aiMasterListYellow[0] = 0
aiMasterListRed[0] = 0

attackPattern[0] = 0

leader = noone
subordinate[0] = noone

currentOrder = 0
orderTargetX = 0
orderTargetY = 0
orderTargetId = noone

alertState = 'green'
hasBeenRed = 0
alertness[0,0] = 0
alertness[0,1] = noone

hearing = 0

centerVisionRange = 0
sideVisionRange = 0

