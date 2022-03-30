if(map[gridX, gridY].occupant == id){ //clears node occupancy if destroyed
	map[gridX, gridY].occupant = noone;
}

if(path_exists(movementPath)){ //cleans up movementPath in case one already exists
	path_delete(movementPath); 		
}

if(global.gameObj.currActor == id){
	global.gameObj.currActor = noone;	
}
		
if(global.cursor.selectedActor == id){
	
	global.cursor.selectedActor = noone;	
	global.cursor.state = "idle";
}