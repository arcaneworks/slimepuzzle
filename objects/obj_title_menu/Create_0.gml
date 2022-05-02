width = 400;
height = 600;
op_border = 8;
op_space = 60;

pos = 0;


option[0,0] = "New Game";
option[0,1] = "Load Game";
option[0,2] = "Continue";
option[0,3] = "Level Editor";
option[0,4] = "Quit Game";
option[0,5] = "Settings";


op_length = 0;

option[2,0] = "Window Size";
option[2,1] = "Volume";
option[2,2] = "Back";
option[3,0] = "Volume Up";
option [3,1] = "Volume Down";
option [3,2] = "Back";
stick_cooldown = 0;
menu_level = 0;

instance_create_layer(x, y, "Instances", obj_interface_menu);
global.cursor = obj_interface_menu;
instance_deactivate_object(obj_new_profile);
instance_deactivate_object(obj_volume_display);
display_set_gui_maximize();
display_set_gui_size(room_width, room_height);
