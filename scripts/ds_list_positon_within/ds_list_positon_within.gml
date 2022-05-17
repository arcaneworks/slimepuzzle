//WARNING : ONLY WORKS WITH DS LISTS FULL OF INSTANCES 
//positions the instances within a ds list based on the width and height of a box.
//used mostly in the write toolbar in the level editor, but could be handy elsewhere

function ds_list_position_within(list, xx, yy, buffer, boxWidth, boxHeight){
	var inst = ds_list_find_value(list, 0);
	var instSize = node_size;
	var listSize = ds_list_size(list);
	var totalWidth = listSize * (buffer + instSize);

	xx += .5 * boxWidth - .5 * totalWidth;
	yy += .5 * boxHeight - .5 * instSize + 6;

	for(var ii = 0; ii < ds_list_size(list); ii++){
		var inst = ds_list_find_value(list, ii);	
		var spriteWidth = node_size;
		inst.x = xx + ii * (buffer + spriteWidth); 
		inst.y = yy;	
	}
}