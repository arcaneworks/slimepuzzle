/// @description 
#macro cam view_camera[0]
#macro base_width 640
#macro base_height 360
current_width = base_width
current_height = base_height

#macro center_window alarm[0]=1
#macro resize_window alarm[1]=1 

#macro resize_app_surface surface_resize(application_surface,current_width*sub_pixel_scale,current_height*sub_pixel_scale)

window_scale= 3;
gui_scale= 1;
sub_pixel_scale= window_scale;
is_full_screen= window_get_fullscreen();


resize_app_surface; 
resize_window;
