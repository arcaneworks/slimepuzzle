event_inherited();


if(gridX != noone && gridY != noone){
	if(map[gridX, gridY].occupant == id){
		if(map[gridX, gridY].terrain != noone && map[gridX, gridY].terrain.terrainString == "HOLE"){
			color = c_gray; 	
			
		}else{
			color = c_white;		
		}	
	}	
}


if(obj_interface_editor.selectedComponent == id){
	alpha = .5;	
}else{
	alpha = 1;	
	
}