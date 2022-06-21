event_inherited();
height = obj_stage_editor.height; 
width = 100;


title = "LEVELS"
var levelFile = file_find_first(working_directory + "CGs/*", 0);
while (levelFile != ""){
	var extNum = string_last_pos(".csv", levelFile)
	var LevelFileNoExt = string_delete(levelFile, extNum, 4);
	
    ds_list_add(objs, LevelFileNoExt);
    levelFile = file_find_next();
}

file_find_close();
// loads all the character/team files into a single list, objs

// initializes the visible objects list; the first [maxVisObjs] objects
// in objs list will be displayed. 

