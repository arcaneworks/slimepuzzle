// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_terrain_info(terrainStruct, terrain, setPos = false){
		var s = terrainStruct;
	var t = terrain;

	
	if(setPos){
		if(map[t.gridX,t.gridY].occupant == id){
			map[t.gridX, t.gridY].occupant = noone;
		}
	}
	
	t.terrainString = s.info.terrainString; 
	t.infoText = s.info.infoText;
	t.sprite = s.info.sprite;
	t.sprite_index = s.info.sprite;
	t.cost = s.info.cost;
	t.gridX = s.info.gridX; 
	t.gridY = s.info.gridY;
	t.xPos = s.info.xPos;
	t.yPos = s.info.yPos; 
	t.dead = s.info.dead;
	t.terrainCode = s.info.terrainCode;
	
	t.slippery = s.effect.slippery;
	t.flamable = s.effect.flamable; 
	t.spreadsFire = s.effect.spreadsFire;
	
	if(setPos){	
		var node = map[gridX, gridY];
		node.terrain = t;
		t.x = node.x;
		t.y = node.y; 
	}
	
}