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
		trap = false;
	}
	
	function terrain_effect_struct() constructor {
		slippery = false;
		flamable = false; 
		spreadsFire = false; 
		damages = false;
		
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
		info.terrainString = "Ice";
		info.infoText = "a fire.";
		info.sprite = spr_ice_sm;
		info.terrainCode = "TF"; 
	}
	
	hole = new terrain_struct();
	with(hole){
		info.terrainString = "HOLE";
		info.infoText = "A hole in the ground. Cannot be moved through. In the legions, preparing these sorts of defensive measures is tactically critical.";
		info.sprite = spr_hole;
		info.terrainCode = "TH";
	}
	
	web = new terrain_struct();
	with(web){
		info.terrainString = "WEB";
		info.infoText = "Large, thick webs. Prevents movement, but can be destroyed by fire. Be very wary, the creatures who spun all of this silk might still be in the area.";
		info.sprite = spr_web;	
		info.terrainCode = "TW";
	}
	
	bonfire = new terrain_struct();
	with(bonfire){
		info.terrainString = "BONFIRE";
		info.infoText = "A roaring campfire, a large open flame. Can be used to burn enemies or light arrows. Fire consumes everything, and erases all mistakes.";
		info.sprite = spr_bonfire_lit;	
		info.terrainCode = "TB";
		
	}
	
	bonfireOff = new terrain_struct();
	with(bonfireOff){
		info.terrainString = "BONFIRE OFF";
		info.infoText = "An unlit campfire, can be lit with fire. Travelers have passed through here recently, although it is impossible to know exactly when.";
		info.sprite = spr_bonfire_off;
		info.terrainCode = "TO";
	}
		
	spike = new terrain_struct(); 
	with(spike){
		info.terrainString = "SPIKE";
		info.infoText = "It's a trap.";
		info.sprite = spr_spike_hole;
		info.terrainCode = "TS";
		info.trap = true;
	}
	
		
	bareStruct = new terrain_struct();
		
	global.terrainDB = {
		flame : other.flame,
		hole : other.hole, 
		web : other.web,
		bonfire : other.bonfire,
		bonfireOff : other.bonfireOff,
		bareStruct : other.bareStruct,
		spike : other.spike
			
	}
	
}