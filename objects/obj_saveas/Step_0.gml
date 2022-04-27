/// @description Insert description here
// You can write your code in this editor
//message = keyboard_string;


if(obj_interface_editor.state != "saveas"){
	instance_destroy();	
	
}

if(!instance_exists(obj_confirm) && !saveNoti){
	if(string_length(keyboard_string) < limit)
		message = keyboard_string;
	else
		keyboard_string =message;

	
	
var saveBox = collision_rectangle(x , y + height, x + width/2, y + height *  2 , obj_interface_editor, false, false);

var cancelBox = collision_rectangle(x + width/2 , y + height , x + width, y + height *  2, obj_interface_editor, false, false);

		

	if(saveBox){
		saveColor = c_green;
		if(mouse_check_button_pressed(mb_left)){
			if(file_exists("CGs\\" + message + ".csv")){
				create_confirm_box(x  + 100, y, "A file with this name already exists. Would you like to overwrite it?", true);
			}else{
				save_CG_set(message);
				obj_interface_editor.selectedTool = noone;
				saveNoti = true;
				
			}
		}
	}else{
		saveColor = c_black;	
	}

	if(cancelBox){
		cancelColor = c_maroon;	
		if(mouse_check_button_pressed(mb_left)){
			instance_destroy(id);	
			obj_interface_editor.state = "move";
			obj_interface_editor.selectedTool = noone;
		}
	}else{
		cancelColor = c_black;	

	}
}
	
if(confirmDec){
	save_CG_set(message);
	confirmDec = false;
	saveNoti = true;
	obj_interface_editor.selectedTool = noone;
}

if(saveNoti == true){
	if(timer > 0){
		timer--	
	}else{
		obj_interface_editor.state = "move";
		instance_destroy()	

	}
}

