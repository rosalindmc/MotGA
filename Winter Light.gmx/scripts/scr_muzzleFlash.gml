//Muzzle
part_type_sprite(pt1,muzzleFlash,true,true,true)
part_type_size(pt1,1,1,0,0)
part_type_color1(pt1,c_white)
part_type_alpha3(pt1,1,1,1)
part_type_speed(pt1,0,0,0,0)
part_type_life(pt1,4,6)
part_type_orientation(pt1,image_angle,image_angle,0,0,false)
part_type_gravity(pt1,0,270)
part_type_scale(pt1,1,1)
part_type_blend(pt1,false)
part_system_depth(ps1,depth)
part_emitter_region(ps1,ps1,x+lengthdir_x(bLength,image_angle),x+lengthdir_x(bLength,image_angle),y+lengthdir_y(bLength,image_angle)-h,y+lengthdir_y(bLength,image_angle)-h,ps_shape_ellipse,ps_distr_linear)
part_emitter_burst(ps1,ps1,pt1,1)
