#define level


#define levelInitialize
//levelInitialize
//we need to make a world to pass information into this script
var global.currNode = argument0

currLevel = instance_create(0,0,obj_level)

with (currLevel){
    biomeType = global.currNode.biomeType
    elements[0] = global.currNode.elements[]
    sizeX = global.currNode.sizeX
    sizeY = global.currNode.sizeY
    
    critPoi = global.currNode.critPoi     //the type of the critical point of interest
    poiDensity = global.currNode.poiDensity //number of points of interest on the map
    numEntrances = global.currNode.numEntrances
    pois[]=global.currNode.pois[]
    numRivers=global.currNode.numRivers
    rivers[numRivers,4] = 0
    
    critPods = global.currNode.critPods    //number of pods on the critical path
    podDensity = global.currNode.podDensity  //number of pods on the map
    
    itemDensity = global.currNode.itemDensity //number of item spawns on the map
    
    specialAreas = global.currNode.specialAreas    //number of special areas to spawn
    
    floorLayout[sizeX,sizeY] = 0    //the map of floors and walls
    
    genLevel()
    for(i = 0; i < array_length_1d(pois)-1; i++){
        roadMaker(floorLayout[pois[i].gridX,pois[i].gridY],floorLayout[pois[i+1].gridX,pois[i+1].gridY])
    }
    for(i=0;i<numRivers;i++){
    riverMaker(floorLayout[rivers[i,0],river[i,1]],floorLayout[rivers[i,2],rivers[i,3]])
    }
    
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
        algoCheckNeighbours(floorLayout[current.gridX-1, current.gridY],0);
    }
    if (current.gridX + 1 != sizeX){
        algoCheckNeighbours(floorLayout[current.gridX+1, current.gridY],0);
    }
    if (current.gridY - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY-1],0);
    }
    if (current.gridY + 1 != sizeY){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY+1],0);
    }
}

ds_priority_destroy(open)
ds_list_destroy(closed)
        
current = finish
while(current.pathParent != noone)
{
    current.pathParent.weight = 1
    current.pathParent.rWeight = 5

    if(current.gridX-1 >= 0){
        if (floorLayout[current.gridX-1, current.gridY].weight > 2){
            floorLayout[current.gridX-1, current.gridY].weight = 2
        }
    }
    
    if(current.gridX+1 < sizeX){
        if (floorLayout[current.gridX+1, current.gridY].weight > 2){
            floorLayout[current.gridX+1, current.gridY].weight = 2
        }
    }
    
    if(current.gridY-1 >= 0){   
        if (floorLayout[current.gridX, current.gridY-1].weight > 2){
            floorLayout[current.gridX, current.gridY-1].weight = 2
        }
    }
        
    if(current.gridY+1 < sizeY){
        if (floorLayout[current.gridX, current.gridY+1].weight > 2){
            floorLayout[current.gridX, current.gridY+1].weight = 2
        }
    }

    current.pathParent.isPath = true
    current = current.pathParent
}




#define riverMaker
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
        algoCheckNeighbours(floorLayout[current.gridX-1, current.gridY],1);
    }
    if (current.gridX + 1 != sizeX){
        algoCheckNeighbours(floorLayout[current.gridX+1, current.gridY],1);
    }
    if (current.gridY - 1 != -1){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY-1],1);
    }
    if (current.gridY + 1 != sizeY){
        algoCheckNeighbours(floorLayout[current.gridX, current.gridY+1],1);
    }
}

ds_priority_destroy(open)
ds_list_destroy(closed)
        
current = finish
while(current.pathParent != noone)
{
    current.pathParent.rWeight = 0.5

    current.pathParent.isRiver = true
    current = current.pathParent
}




#define wipeTiles
with (obj_floor){
    g = 0
    pathParent=noone
}


#define algoCheckNeighbours
//TAKES AN ARGUMENT FOR ADJACENT TILE AND ROAD (0) OR RIVER (1)

switch (argument1){
case 0:
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
}*/
break;
case 1:
var adjacent = argument0;
var tempG = current.g + adjacent.rWeight;

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
}*/
break;
};