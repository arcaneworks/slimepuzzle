/// @description Insert description here
// You can write your code in this editor
//message = keyboard_string;
if(string_length(keyboard_string) < limit)
	message = keyboard_string;
else
	keyboard_string =message;
	
	
var saveBox = collision_rectangle(x +22, y + height +22, x + width/2, y + height *  2 , obj_interface_editor, false, false);

var cancelBox = collision_rectangle(x + width/2 + 22, y + height + 22, x + width - 5, y + height *  2, obj_interface_editor, false, false);


if(saveBox){
	saveColor = c_green;	

	if(mouse_check_button_pressed(mb_left)){
		instance_deactivate_object(id);	
		
	}
}else{
	saveColor = c_black;	
	
}

if(cancelBox){
	cancelColor = c_maroon;	
	if(mouse_check_button_pressed(mb_left)){
		instance_deactivate_object(id);	
		
	}
}else{
	cancelColor = c_black;	
	
}
