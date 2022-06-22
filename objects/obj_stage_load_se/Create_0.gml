event_inherited();
x = obj_stage_editor.x + obj_stage_editor.width * 1.5;
y = obj_stage_editor.y + .5 * obj_stage_editor.height + 15;
height = 150; 
width = 100;
levelList = obj_stage_editor.levelList;
title = "LOAD STAGE";
var levelFile = file_find_first(working_directory + "Stages/*", 0);
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

