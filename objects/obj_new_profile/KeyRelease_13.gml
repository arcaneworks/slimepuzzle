/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_confirm)){
	confirmDec = true;	
}
if(confirmDec){
	global.playerProfile = message;
	room_goto_next();
}
if(file_exists("saves\\" + message + ".sav")){
		create_confirm_box(x + 200, y, "A file with this name already exists. Would you like to overwrite it?", true);
	}else{
		global.playerProfile = message;
		room_goto_next();
	}
	




