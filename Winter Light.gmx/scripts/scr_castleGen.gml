
for (var i=0;i<20;i++){
    for (var ii = 0; ii<20; ii++){
        instance_create (i*8*metre, ii*8*metre, obj_floor)
    }
}

for (var i=0;i<160;i++){
    instance_create (i*metre,0*metre,obj_terrain)
    instance_create (i*metre,158*metre,obj_terrain)
} 

for (var i=0;i<160;i++){
    instance_create (0*metre,i*metre,obj_terrain)
    instance_create (158*metre,i*metre,obj_terrain)
} 

instance_create(120*metre, 80*metre, obj_camera)
instance_create(120*metre, 80*metre, obj_char)

