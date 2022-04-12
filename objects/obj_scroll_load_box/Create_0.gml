event_inherited();
depth = -100;
x = 62; 
y = 377;
var displaySpace = sprite_height * 9 / 10;
objHeight = 20;

tweenSpace = 2;

maxVisObjs = floor((displaySpace + tweenSpace) / (objHeight + tweenSpace));

title = "LOAD MENU";
mpos = 0;
selected = noone;
textColor = c_white;

var levelFile = file_find_first(working_directory + "CGs/*", 0);
while (levelFile != ""){
	var extNum = string_last_pos(".csv", levelFile)
	var LevelFileNoExt = string_delete(levelFile, extNum, 4);
	
    ds_list_add(objs, LevelFileNoExt);
    levelFile = file_find_next();
}

file_find_close();
// loads all the character/team files into a single list, objs


for (ii = 0; ii < maxVisObjs && ii < ds_list_size(objs); ii++) {
	var obj = ds_list_find_value(objs, ii);
	ds_list_add(visObjs, obj);
}
// initializes the visible objects list; the first [maxVisObjs] objects
// in objs list will be displayed. 

