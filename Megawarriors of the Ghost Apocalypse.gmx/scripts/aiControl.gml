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

currentAction = 0
actionTargetX = 0
actionTargetY = 0
actionTargetId = noone

alertState = 'green'
hasBeenRed = 0
alertness = ds_priority_create()

hearing = 0

centerVisionRange = 0
sideVisionRange = 0


#define aiDestroy
ds_priority_destroy(alertness)
