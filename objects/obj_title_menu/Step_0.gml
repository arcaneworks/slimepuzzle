// get and change selection
op_length = array_length(option[menu_level]);
height = op_length * op_space + op_border * 2;

up_key = keyboard_check_pressed(vk_up ) +  keyboard_check_pressed(ord("W") );
//leftstick = gamepad_axis_value(0,gp_axislv);
leftstick = gamepad_button_check(0,gp_padd) - gamepad_button_check(0,gp_padu);
if(stick_cooldown <= 0 && leftstick < -0.5){
up_key = 1;
stick_cooldown = 0.2;
}

down_key = keyboard_check_pressed(vk_down) +  keyboard_check_pressed(ord("S"));
if(stick_cooldown <= 0 && leftstick > 0.5){
down_key = 1;
stick_cooldown = 0.2;
}
accept_key = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space) + keyboard_check_pressed(vk_enter) + gamepad_button_check_pressed(0, gp_face1);
//move through the menu
pos += down_key - up_key;

if(pos >= op_length)
	pos = 0;
if(pos < 0)
	pos = op_length-1;
	
	
if(stick_cooldown > 0){
stick_cooldown -= delta_time/ 1000000;
}
	
col0 = collision_rectangle(x + op_border, y + op_border, x + op_border + width,  y + op_border + op_space, obj_interface_menu, false, true);
col1 = collision_rectangle(x + op_border, y + op_border + op_space, x + op_border + width,  y + op_border * 2 + op_space * 2, obj_interface_menu, false, true);
col2 = collision_rectangle(x + op_border, y + op_space * 2, x + op_border + width,  y + op_border * 3 + op_space * 3, obj_interface_menu, false, true);
col3 = collision_rectangle(x + op_border, y + op_space * 3, x + op_border + width,  y + op_border * 4 + op_space * 4, obj_interface_menu, false, true);
col4 =  collision_rectangle(x + op_border, y + + op_space * 4, x + op_border + width,  y + op_border * 5 + op_space * 5, obj_interface_menu, false, true);
if(col0){
	pos = 0;
}
if(col1){
	pos = 1;
}
if(col2){
	pos = 2;
}
if(col3){
	pos = 3;
}
if(col4){
	pos = 4;
}

if(accept_key > 0){
	
	switch(menu_level){
		case 0:
			switch(pos)
			{
			case 0:
				//start game
				instance_deactivate_object(obj_title_menu);
				//instance_create_depth(0,0,0,obj_new_profile);
				instance_activate_object(obj_new_profile);
				//room_goto_next();
				break;
			case 1:
				//settings
				menu_level = 1;
				option[1] = get_save_file_list();
				
				array_push(option[1], "Back");
				op_length = array_length(option[menu_level]);
				break;

			case 2:
				//quit game
				game_end();
				break;
			case 3:
				//load last autosave
				global.cursor = noone;
				load_player_data(global.playerProfile);
				room_goto_next();
				break;
			case 4:
				//load level editor
				global.cursor = noone;
				room_goto(level_editor);
				break;
			}
			break;
		case 1:
			if(pos == op_length)
				{
					menu_level = 0;
					
				}
			else
				{
					load_player_data(option[1,pos]);
					global.cursor = noone;
					room_goto_next();
					
				}
			//switch(pos){
			//	case 0:
			//		//Window Size
			//		break;
			//	case 1:
			//		//Brightness
			//		break;
			//	case 2:
			//		//Back
			//		menu_level = 0;
			//		break;
			//}
	}
}