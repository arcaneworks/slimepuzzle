// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_turn_order(){
	
	ds_list_clear(turnList);
	
	

	for(var gg = 0; gg < instance_number(obj_enemy); gg++){
	    var tempEnemy = instance_find(obj_enemy, gg); 
		if(tempEnemy.hasTurn){
			ds_list_add(turnList, tempEnemy);
		}
	}
	
	sort_by_speed(turnList, 0, ds_list_size(turnList) - 1); 


	
}