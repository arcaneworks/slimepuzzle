event_inherited();



if(hp == maxHp - 1){
	image_index = 1;	
}

if(hp <= 0){
		map[gridX, gridY].occupant = noone;
		image_index = 2;
		depth = 5;
		if(contents != noone){
			ds_list_add(obj_portrait.inventory, contents);
		}
	
}

