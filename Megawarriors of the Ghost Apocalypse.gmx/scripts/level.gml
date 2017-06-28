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
    wipeTiles()
    roadMaker()
    
}


#define roadMaker

for(var i = 0;i<array_length_1d(pois);i++){
    if (i+1 < array_length_1d(pois)){
        var closed, start, finish
        
        start = floorLayout[pois[i].x,pois[i].y]
        finish = floorLayout[pois[i+1].x,pois[i+1].y]
                
        open = ds_priority_create()
        ds_priority_add(open,start,0)
        
        closed = ds_list_create()
        current = start;
        //start pathing
        
        while(current != finish && ds_priority_size(open)>0){
            current = ds_priority_delete_min(open);
            ds_list_add(closed, current);
            
            //step through all neighbours but only if they've you permission to pee on the lawn
            if (current.x - 1 != -1){
                algoCheckNeighbours(floorLayout[current.x-1, current.y]);
            }
            if (current.x + 1 != sizeX){
                algoCheckNeighbours(floorLayout[current.x+1, current.y]);
            }
            if (current.y - 1 != -1){
                algoCheckNeighbours(floorLayout[current.x, current.y-1]);
            }
            if (current.y + 1 != sizeY){
                algoCheckNeighbours(floorLayout[current.x, current.y+1]);
            }
  
        }

        ds_priority_destroy(open)
        
        for(var i = 0; i < ds_list_size(closed); i++){
            //get current; make it a road; where we're going, we defs need roads
            current = ds_list_find_value(closed, i);
            current.weight = 1;
            current.isPath = true;
        }
        
        ds_list_destroy(closed)
    }
}



#define wipeTiles
with (obj_floor){
    g = 0
    pathParent=noone
}


#define algoCheckNeighbours
//TAKES AN ARGUMENT

var adjacent = argument0;
var tempG = current.g + adjacent.weight;
//attempt to reach an unreached tile
if(ds_priority_find_priority(open,adjacent) == 0 || ds_priority_find_priority(open,adjacent) == undefined){
    adjacent.pathParent = current;
    adjacent.g = tempG;
    ds_priority_add(open, adjacent, adjacent.g);
}

//attempt to reach an already calculated tile faster
else{
    if(tempG < adjacent.g){
        adjacent.pathParent = current;
        adjacent.g = tempG;
        ds_priority_change_priority(open, adjacent, adjacent.g);
    }
}

