event_inherited();

var push;
push = max(keyboard_check_released(vk_enter), keyboard_check_released(ord("Z")), select_pressed(), 0);
// checks whether the user has (with keyboard or mouse) selected an object.

if(obj_interface_editor.state != "load"){
	instance_deactivate_object(id);	
	instance_deactivate_object(bar);
	instance_deactivate_object(obj_scroll_bead);
}

if(push == 1 && selected != noone){
	
	global.editorTarget = selected;
	room_restart();

}	
