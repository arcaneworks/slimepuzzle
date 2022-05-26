// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_terrain_info(terrainStruct, terrain, setPos = false){
	var t = terrain;
	var s = terrainStruct;
	
	if(setPos){
		if(map[t.gridX,t.gridY].occupant == id){
			map[t.gridX, t.gridY].occupant = noone;
		}
	}
	terrainString = s.terrainString; 
	infoText = s.infoText;
	sprite = s.sprite;
	effect = s.effect;
	cost = s.cost;
	gridX = 0; 
	gridY = 0;
	xPos = 0;
	yPos = 0; 
	dead = false;
	
}