event_inherited();

if(breaking){	
	durability -= 1;
	breaking = false;		
}


if(durability == maxDurability - 1){
	image_index = 1;	
	
}
if(durability <= 0){
		map[gridX, gridY].occupant = noone;
		image_index = 2;
		depth = 5;
		if(contents != noone){
			ds_list_add(obj_portrait.inventory, contents);
		}
	
}

