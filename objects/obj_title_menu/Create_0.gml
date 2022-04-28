width = 400;
height = 600;
op_border = 8;
op_space = 60;

pos = 0;


option[0,0] = "New Game";
option[0,1] = "Load Game";
option[0,2] = "Quit Game";
option[0,3] = "Continue";
option[0,4] = "Level Editor";

op_length = 0;

option[1,0] = "Window Size";
option[1,1] = "Brightness";
option[1,2] = "Back";
stick_cooldown = 0;
menu_level = 0;

instance_create_layer(x, y, "Instances", obj_interface_menu);
global.cursor = obj_interface_menu;
instance_deactivate_object(obj_new_profile);

display_set_gui_maximize();
display_set_gui_size(room_width, room_height);
