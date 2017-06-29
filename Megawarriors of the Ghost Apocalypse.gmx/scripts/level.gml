#define level


#define levelInitialize
//levelInitialize
//we need to make a world to pass information into this script
var currNode = argument0

currLevel = instance_create(0,0,obj_level)

with (currLevel){
    biomeType = currNode.biomeType
    elements[0] = currNode.elements[]
    sizeX = currNode.sizeX
    sizeY = currNode.sizeY
    
    critPoi = currNode.critPoi     //the type of the critical point of interest
    poiDensity = currNode.poiDensity //number of points of interest on the map
    numEntrances = currNode.numEntrances
    pois[]=currNode.pois[]
    
    critPods = currNode.critPods    //number of pods on the critical path
    podDensity = currNode.podDensity  //number of pods on the map
    
    itemDensity = currNode.itemDensity //number of item spawns on the map
    
    specialAreas = currNode.specialAreas    //number of special areas to spawn
    
    floorLayout[sizeX,sizeY] = 0    //the map of floors and walls
    
    genLevel()
    for(i = 0; i < array_length_1d(pois)-1; i++){
        roadMaker(floorLayout[pois[i].gridX,pois[i].gridY],floorLayout[pois[i+1].gridX,pois[i+1].gridY])
    }
    
}


#define wipeTiles
with (obj_floor){
    g = 0
    pathParent=noone
}


#define roadMaker
wipeTiles()
        
var start

start = argument0
finish = argument1
        
open = ds_priority_create()
ds_priority_add(open,start,0)

closed = ds_list_create()
current = start;
//start pathing

while(current != finish){
    current = ds_priority_delete_min(open);
    ds_list_add(closed, current);
    
    //step through all neighbours
    if (current.gridX - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX-1, current.gridY]);
    }
    if (current.gridX + 1 != sizeX){
        algoCheckNeighbours(floorLayout[current.gridX+1, current.gridY]);
    }
    if (current.gridY - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY-1]);
    }
    if (current.gridY + 1 != sizeY){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY+1]);
    }
}

ds_priority_destroy(open)
ds_list_destroy(closed)
        
current = finish
while(current.pathParent != noone)
{
    current.pathParent.weight = 1       
    current.pathParent.isPath = true
    current = current.pathParent
}




#define algoCheckNeighbours
//TAKES AN ARGUMENT

var adjacent = argument0;
var tempG = current.g + adjacent.weight;

if ds_list_find_index(closed, adjacent) < 0
    {
    //attempt to reach an unreached tile
    if(ds_priority_find_priority(open,adjacent) == 0 || ds_priority_find_priority(open,adjacent) == undefined){
        adjacent.pathParent = current;
        adjacent.g = tempG;
        ds_priority_add(open, adjacent, adjacent.g+point_distance(adjacent.gridX,adjacent.gridY,finish.gridX,finish.gridY)+random(.5));
    }
}
/*
else{
//attempt to reach an already calculated tile faster
    if(tempG < adjacent.g){
        adjacent.pathParent = current;
        adjacent.g = tempG;
        ds_priority_change_priority(open, adjacent, adjacent.g+point_distance(adjacent.gridX,adjacent.gridY,finish.gridX,finish.gridY));
    }
}
