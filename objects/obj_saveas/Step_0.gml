/// @description Insert description here
// You can write your code in this editor
//message = keyboard_string;


if(global.cursor.state != "saveas"){
	instance_destroy();	
	
}

if(!instance_exists(obj_confirm) && !saveNoti){
	if(string_length(keyboard_string) < limit)
		message = keyboard_string;
	else
		keyboard_string =message;

	
	
var saveBox = collision_rectangle(x , y + height, x + width/2 - 2, y + height *  2 , global.cursor, false, false);

var cancelBox = collision_rectangle(x + width/2 , y + height , x + width, y + height *  2, global.cursor, false, false);

		

	if(saveBox){
		saveColor = c_green;
		if(select_pressed()){
			if(file_exists("CGs\\" + message + ".csv")){
				create_confirm_box(x  + 100, y, "A file with this name already exists. Would you like to overwrite it?", true);
			}else{
				save_CG_set(message);
				global.cursor.selectedTool = noone;
				saveNoti = true;
				
			}
		}
	}else{
		saveColor = c_black;	
	}

	if(cancelBox){
		cancelColor = c_maroon;	
		if(select_pressed()){
			instance_destroy(id);	
			global.cursor.state = "move";
			global.cursor.selectedTool = noone;
		}
	}else{
		cancelColor = c_black;	

	}
}
	
if(confirmDec){
	save_CG_set(message);
	confirmDec = false;
	saveNoti = true;
	global.cursor.selectedTool = noone;
}

if(saveNoti == true){
	if(timer > 0){
		timer--	
	}else{
		global.cursor.state = "move";
		instance_destroy()	

	}
}

