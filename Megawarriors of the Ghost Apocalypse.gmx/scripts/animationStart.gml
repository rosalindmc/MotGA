#define animationStart
//animationStart(anim,track)
//track0 = movement
//track 1 and 2 are hands 1 and 2
animStep[argument1] = 0
animIndex[argument1] = argument0
script_execute(argument0,argument1)

#define animEndStep
//animEndStep()
animDelay[argument0] -= animSpeed[argument0]/global.frameRate

if animDelay[argument0] <= 0
{
    animStep[argument0] += sign(animSpeed[argument0])    
    script_execute(animIndex[argument0],animStep[argument0],argument0)
}