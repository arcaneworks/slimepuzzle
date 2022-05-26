// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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

