/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(obj_confirm)){
	
	instance_deactivate_object(obj_new_profile);
	instance_activate_object(obj_title_menu);
}else{
	instance_destroy(obj_confirm);	
	
}
