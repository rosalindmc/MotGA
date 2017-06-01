part_system_depth(Sname,-y)

//Fire
part_type_speed(particle1,100/global.frameRate,200/global.frameRate,-0.20,0);
part_type_speed(smoke1,100/global.frameRate,200/global.frameRate,-0.20,0);

part_emitter_region(Sname,emitter1,x,x,y,y,0,0);
part_emitter_burst(Sname,emitter1,smoke1,10);
part_emitter_burst(Sname,emitter1,particle1,25);

//Shockwave
part_emitter_burst(Sname,emitter1,em1,1);

//Explosion
part_emitter_burst(Sname,emitter1,particle3,10);

