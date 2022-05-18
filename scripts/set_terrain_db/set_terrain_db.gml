// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_terrain_db(){
	function terrain_info_struct(_terrainString = "NO TERRAIN STRING", _infoText = "NO TERRAIN TEXT", _sprite = spr_error0 ) constructor {
		terrainString = _terrainString; 
		infoText = _infoText;
		sprite = _sprite;
	}
	
	
	flame = new terrain_info_struct("FLAME", "a fire.", spr_fire_loop4);
	hole = new terrain_info_struct("HOLE", "a hole. actors within it cannot act. it can be filled with a rock.", spr_hole); 
	web = new terrain_info_struct("WEB", "a web. actors within it cannot act. it can be destroyed by fire.", spr_web);
	bonfire = new terrain_info_struct("BONFIRE", "a lit bonfire. eleminates actors within.", spr_bonfire_lit);
	bonfireOff = new terrain_info_struct("BONFIRE OFF", "an unlit bonfire. It can be lit with fire.", spr_bonfire_off);
	
}