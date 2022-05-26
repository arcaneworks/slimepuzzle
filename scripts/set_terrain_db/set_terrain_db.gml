// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_terrain_db(){
	function terrain_info_struct(_terrainString = "NO TERRAIN STRING", _infoText = "NO TERRAIN TEXT", _sprite = spr_error0 ) constructor {
		terrainString = _terrainString; 
		infoText = _infoText;
		sprite = _sprite;
		terrainCode = "NO TERRAIN CODE IN DATABASE";
		cost = 1;
		gridX = 0; 
		gridY = 0;
		xPos = 0;
		yPos = 0; 
		dead = false;
	}
	
	function terrain_effect_struct() constructor {
		slippery = false;
		flamable = false; 
		spreadsFire = false; 
		
	}
	
	function terrain_struct(
		_info = new terrain_info_struct(),
		_effect = new terrain_effect_struct()
	
	) constructor {
		info = _info;
		effect = _effect;
	}
	
	flame = new terrain_struct();
	with(flame){
		info.terrainString = "FLAME";
		info.infoText = "a fire.";
		info.sprite = spr_fire_loop4;
		info.terrainCode = "TF"; 
	}
	
	hole = new terrain_struct();
	with(hole){
		info.terrainString = "HOLE";
		info.infoText = "a hole. actors within it are disabled. it can be filled with a rock";
		info.sprite = spr_hole;	
		info.terrainCode = "TH";
	}
	
	web = new terrain_struct();
	with(web){
		info.terrainString = "WEB";
		info.infoText = "a web. actors within it cannot act. it can be destroyed by fire.";
		info.sprite = spr_web;	
		info.terrainCode = "TW";
	}
	
	bonfire = new terrain_struct();
	with(bonfire){
		info.terrainString = "BONFIRE";
		info.infoText = "a lit bonfire. eleminates actors within.";
		info.sprite = spr_bonfire_lit;	
		info.terrainCode = "TB";
		
	}
	
	bonfireOff = new terrain_struct();
	with(bonfireOff){
		info.terrainString = "BONFIRE OFF";
		info.infoText = "an unlit bonfire. It can be lit with fire.";
		info.sprite = spr_bonfire_off;	
		info.terrainCode = "TO";
	}
		
	global.terrainDB = {
		flame : other.flame,
		hole : other.hole, 
		web : other.web,
		bonfire : other.bonfire,
		bonfireOff : other.bonfireOff
			
			
	}
	
}