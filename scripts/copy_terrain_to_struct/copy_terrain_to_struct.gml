//sets a struct's variables based on the instance variables of obj_terrain.
//used to take a snapshot of a terrain's variables for the undoList


//set_terrain_info is the inverse of this script
function copy_terrain_to_struct(terrain, struct){
		var t = terrain;
		var s = struct;
		
		s.info.terrainString = t.terrainString;
		s.info.infoText = t.infoText;
		s.info.sprite = t.sprite_index;
		s.info.terrainCode = t.terrainCode;
		s.info.xPos = t.x; 
		s.info.yPos = t.y;
		s.info.gridX = t.gridX; 
		s.info.gridY = t.gridY;
		s.info.dead = t.dead;
		s.info.cost = t.cost;
		
		s.effect.slippery = t.slippery;
		s.effect.flamable = t.flamable; 
		s.effect.spreadsFire = t.spreadsFire;
		
}

