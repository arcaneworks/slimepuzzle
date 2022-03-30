// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_targets_onScreen(){
	
	with(obj_enemy){
		if(map[gridX, gridY].onScreen){
			get_targets();		
		}				
	}
}