event_inherited();
depth = -100;
x = 8; 
y = 55;
var displaySpace = sprite_height * 9 / 10;
objHeight = 20;

tweenSpace = 2;

maxVisObjs = floor((displaySpace + tweenSpace) / (objHeight + tweenSpace));

title = "LOAD MENU";
mpos = 0;
selected = noone;
textColor = c_white;

var barWidthRatio = 1/20; // how wide the scroll bar is relative to the whole window
bar = instance_create_layer(x, y, "Instances", obj_scroll_bar);
bar.x = x + width; 
bar.y = y; 
bar.depth = depth - 1;
bar.image_yscale = image_yscale;

var beadGap = 1/20; // how much space separates the bead from the 
					// bottom/top of the bar at its lowest/highest point,
bar.bead.topLimit = y + (bar.sprite_height * beadGap); // highest point the bead can reach on bar
bar.bead.bottomLimit = y + (bar.sprite_height * (1 - beadGap)) - bar.bead.sprite_height; // lowest point
bar.bead.x = bar.x + (bar.sprite_width/2);
bar.bead.y = bar.bead.topLimit; 



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

