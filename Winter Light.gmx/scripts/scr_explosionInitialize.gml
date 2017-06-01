Sname = part_system_create()

particle1 = part_type_create();
part_type_sprite(particle1,spr_explosion,false,false,true);
part_type_size(particle1,.4,.6,0,0);
part_type_scale(particle1,1,1);
part_type_color3(particle1,65535,33023,0)
part_type_alpha3(particle1,1,0.50,0);

part_type_speed(particle1,0,20/global.frameRate,-10/global.frameRate,0);

part_type_direction(particle1,0,359,0,0);

part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,359,0,720/global.frameRate,720/global.frameRate);
part_type_blend(particle1,1);
part_type_life(particle1,.20*global.frameRate,.35*global.frameRate);

smoke1 = part_type_create();
part_type_sprite(smoke1,spr_explosion,false,false,true);
part_type_size(smoke1,.3,.5,0,0);
part_type_scale(smoke1,1,1);
part_type_color3(smoke1,c_gray,c_black,c_black)
part_type_alpha3(smoke1,0,1,0);

part_type_speed(smoke1,0,20/global.frameRate,-10/global.frameRate,0);

part_type_direction(smoke1,0,359,0,0);

part_type_gravity(smoke1,0,270);
part_type_orientation(smoke1,0,359,0,720/global.frameRate,720/global.frameRate);
part_type_blend(smoke1,0);
part_type_life(smoke1,.20*global.frameRate,.35*global.frameRate);

em1 = part_type_create();
part_type_shape(em1,pt_shape_ring);
part_type_size(em1,0.15,0.15,50/global.frameRate,0);
part_type_scale(em1,0.20,0.10);
part_type_color1(em1,16777215);
part_type_alpha3(em1,1,0.50,0);
part_type_speed(em1,0,0,0,0);
part_type_direction(em1,85,95,0,0);
part_type_gravity(em1,0,270);
part_type_orientation(em1,0,0,0,0,0);
part_type_blend(em1,0);
part_type_life(em1,.20*global.frameRate,.25*global.frameRate);

particle3 = part_type_create();
part_type_shape(particle3,pt_shape_flare);
part_type_size(particle3,1,1,-0.5/global.frameRate,0);
part_type_scale(particle3,0.20,0.20);
part_type_color3(particle3,16777215,65535,33023);
part_type_alpha3(particle3,1,1,0);
part_type_speed(particle3,350/global.frameRate,400/global.frameRate,-2/global.frameRate,0);
part_type_direction(particle3,40,140,0,0);
part_type_gravity(particle3,0,90);
part_type_orientation(particle3,0,0,1,1,0);
part_type_blend(particle3,0);
part_type_life(particle3,.15*global.frameRate,.2*global.frameRate);
part_type_step(particle3,3,particle1)

emitter1 = part_emitter_create(Sname);

//Base Emit
part_emitter_region(Sname,emitter1,xstart-20,xstart+20,ystart-h-20,ystart-h+20,ps_shape_ellipse,ps_distr_invgaussian);
part_emitter_burst(Sname,emitter1,particle1,10);
