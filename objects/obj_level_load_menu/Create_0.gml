width = 120;
height = 240;
op_border = 8;
op_space = 30;
stick_cooldown = 0.5;
pos = 0;
option = get_level_file_list();
				
array_push(option, "Back");
op_length = array_length(option);

op_length = 0;

menu_level = 0;
instance_deactivate_object(obj_level_load_menu);