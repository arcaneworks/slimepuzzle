event_inherited();

var push;
push = max(keyboard_check_released(vk_enter), keyboard_check_released(ord("Z")), select_pressed(), 0);
// checks whether the user has (with keyboard or mouse) selected an object.

if(push == 1 && selected != noone){
	
	if(obj_interface_stage.selectedBox != noone){
		obj_interface_stage.selectedBox.level = selected; 
			obj_interface_stage.selectedBox = noone;
	}

}	
