// get and change selection
op_length = array_length(option);

up_key = keyboard_check_pressed(vk_up) +  keyboard_check_pressed(ord("W"));
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
accept_key = keyboard_check_pressed(vk_space) + keyboard_check_pressed(vk_enter);
//move through the menu
pos += down_key - up_key;

if(stick_cooldown > 0){
stick_cooldown -= delta_time/ 1000000;
}
if(pos >= op_length)
	pos = 0;
if(pos <0)
	pos = op_length-1;

if(accept_key > 0){
	
			if(pos == op_length)
				{
					instance_deactivate_object(obj_level_load_menu);
					
				}
			else
				{
					global.editorTarget = (string_replace( option[pos],".csv",""));
					room_restart();
					
				}
	
}

if(global.cursor.state != "load"){
	instance_deactivate_object(id);	
	
}