#define worldNode


#define nodeInit
    biomeType = 4
    elements[0] = 0
    sizeX = 50
    sizeY = 50
    
    critPoi = 1     //the type of the critical point of interest
    poiDensity = 13 //number of points of interest on the map
    numEntrance = 3
    pois[0]=0
    numRivers = 4

    rivers[numRivers,4] = 0    
    
    
    critPods =0    //number of pods on the critical path
    podDensity = 0  //number of pods on the map
    
    itemDensity = 0 //number of item spawns on the map
    
    specialAreas = 0   //number of special areas to spawn
    
    floorLayout[sizeX,sizeY] = 0    //the map of floors and walls

#define nodeGen

