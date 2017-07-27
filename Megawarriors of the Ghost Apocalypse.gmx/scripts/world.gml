#define world


#define worldInit

map[0] = instance_create(0,0,obj_node)
with(map[0]){
    nodeGen()
}

global.currNode = map[0]


#define worldGen

