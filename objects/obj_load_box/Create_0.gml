event_inherited();

var displaySpace = sprite_height * 9 / 10;
objHeight = 20;

tweenSpace = 2;

maxVisObjs = floor((displaySpace + tweenSpace) / (objHeight + tweenSpace));

title = "LOAD MENU";
mpos = 0;
menuSelect = noone;
textColor = c_white;

state = "initializing";

var levelFile = file_find_first(working_directory + "CGs/*", fa_directory);
while (levelFile != ""){
	
    ds_list_add(objs, levelFile);
    levelFile = file_find_next();
}



 for (ii = 0; ii < maxVisObjs && ii < ds_list_size(objs); ii++) {
	ds_list_add(visObjs, ii);
 }
// initializes the visible objects list; the first four objects
// in objs list will be displayed. 
