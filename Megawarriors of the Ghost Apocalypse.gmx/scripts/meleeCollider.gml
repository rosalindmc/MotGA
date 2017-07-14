#define meleeCollider


#define meleeColliderInitialize
z = 0
collision = false

#define meleeColliderDraw
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,c_white,1)

#define meleeColliderStep
