#define levelGenMaster
/*
1) Create map to size
    Variables
        MapSizeX (Possibly random)
        MapSizeY
        MapContent [MapSizeX][MapSizeY]
        
    Give each tile a value according to variance and non-1 scaling
        
2) Generate PoI
    Variables
        PoILoc[] (multiple of 3 index array for location)
            Exit
            Miniboss    (Major)
            SpecItem    (Major?)
            Shrine
            Ally        (Major)
            Character   (Major)
            Site
            DungeonEnt  (Major)
            Door
            Key
            
            
    Points have an area where they set the value in MapContent to a value 
        that won't be used to generate other stuff as well as an entrance 
        point at a random point along the outside of the area. If a point's 
        area intersects with another's, reset the MapContent and move the 
        points away from eachother.

Connect points of interest with paths and generate paths
    Variables
        List or Array of points  
        
    Generate some extra points and add them to the PoI list as 
    Shuffle the list  

    Put all PoI entrances on a list, then shuffle the list.
    Using a* and the terrain costs, connect each PoI entrance
        with the next one on a list. Set all the tiles used as 1s
        (or 1s in the case of bridges)
          
        
    
4)Generate PoI from marked spaces
    
    Check type of area.
    Build according to area rules
    Look at the road entering entrance and find its' bearing in regards to important
        spaces. If there is no important space, add faded road tile.
    Add encounters if needed
    
5)Generate Pods
    
    Arbitrarily choose a number of road Pods
        Place them at spaces on the road, give them a type according to either
            the biome or major site
    Check each PoI and roll if it has a Pod attached
        Generate the Pod at the PoI
    Generate some pods at random points on the map
        Generate a path to the nearest road using only bends
    Generate patrols from entrances that the player isn't at
        
6)Generate LootDrops
    
    Arbitrarily place items on generated spaces
        Choose the items based on the tile it's on
    
7)Generate walls

    For every space that hasen't been generated
        Check how close to a space that has a road, PoI tile, or Pod.
        Generate walls with chances dependant on how far it is from these tiles.
        
8)Generate terrain details


9)Generate foliage


10)Generate doodads

   
*/


#define genLevel

switch(biomeType){
case 4:
    forestGen(id)

}



#define forestGen
//Generation specific to forests

//Set the A* heuristic for each tile


//floor tile setup
for (var i=0; i<sizeX; i++){
    for (var j=0; j<sizeY; j++){
        floorLayout[i,j]= instance_create(i,j,obj_floor)
        floorLayout[i,j].weight = choose(1,2,3,4,5,6,7,8)
        floorLayout[i,j].g = 0
        floorLayout[i,j].isPath = false
        floorLayout[i,j].hasPoi = false
    }
}

//set up the positions of points of interests
pois[0] = instance_create(irandom(sizeX-5)+2,irandom(sizeY-5)+2,obj_poi)
for (var i = 1; i<=poiDensity;i++){
    pois[i] = instance_create(irandom(sizeX-5)+2,irandom(sizeY-5)+2,obj_poi)
}
for (var i = 1; i<=numEntrance;i++){
    switch(i%4){
        case 0:
            pois[i+poiDensity] = instance_create(irandom(sizeX-5)+2,0,obj_poi)
        case 1:
            pois[i+poiDensity] = instance_create(0,irandom(sizeY-5)+2,obj_poi)
        case 2:
            pois[i+poiDensity] = instance_create(irandom(sizeX-5)+2,sizeY-1,obj_poi)
        case 3:
            pois[i+poiDensity] = instance_create(sizeX-1,irandom(sizeY-5)+2,obj_poi)
    }
}
with(obj_poi){
    other.floorLayout[x,y].weight = 10
    other.floorLayout[x,y].hasPoi = true
}

<<<<<<< HEAD
/*
//Set up the positions of the special areas (by center point)
for(var i =0;i<specialAreas;i++){
    var posX = 
}
*/

=======
>>>>>>> origin/master
