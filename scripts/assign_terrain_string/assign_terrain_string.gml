//assigns a terrain their terrainString based on the second letter of their terrain code
function assign_terrain_string(char){
	
		var tempTerrain = "none";
		
	switch(char){
		
		case "L":
			tempTerrain = "FLAME";
		break;
		
		case "H":
			tempTerrain = "HOLE";
		break;
		
		case "W":
			tempTerrain = "WEB";
		break;
		
		case "B":
			tempTerrain = "BONFIRE";
		break;
		
		case "O":
			tempTerrain = "BONFIRE OFF";
		break;
		
		
		
	}
	
	return tempTerrain
}