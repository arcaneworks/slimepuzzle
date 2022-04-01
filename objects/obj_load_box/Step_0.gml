event_inherited();

var push;
push = max(keyboard_check_released(vk_enter), keyboard_check_released(ord("Z")), mouse_check_button_pressed(mb_left), 0);
// checks whether the user has (with keyboard or mouse) selected an object.



if(push == 1){ 
	
	// if the user has chosen a file, and there's at least one character space, check the file.
	load_CG_set(selected);
	
			
}
	
