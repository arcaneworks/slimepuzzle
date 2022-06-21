/// @description Insert description here
// You can write your code in this editor
//message = keyboard_string;



if(!instance_exists(obj_confirm) && !saveNoti){
	if(string_length(keyboard_string) < limit)
		message = keyboard_string;
	else
		keyboard_string =message;

	
	
var saveBox = collision_rectangle(x + width, y, x + width + width/2, y + height, global.cursor, false, false);



	if(saveBox){
		saveColor = c_green;
		if(select_pressed()){
			if(file_exists("Stages\\" + message + ".csv")){
				create_confirm_box(x  + 100, y, "A file with this name already exists. Would you like to overwrite it?", true);
			}else{
				save_stage(message);
				global.cursor.selectedTool = noone;
				saveNoti = true;
				
			}
		}
	}else{
		saveColor = c_black;	
	}

}
	
if(confirmDec){
	save_stage(message);
	confirmDec = false;
	saveNoti = true;
	global.cursor.selectedTool = noone;
}

if(saveNoti == true){
	if(timer > 0){
		timer--	
	}else{
		timer = 10; 
		saveNoti = false;

	}
}

