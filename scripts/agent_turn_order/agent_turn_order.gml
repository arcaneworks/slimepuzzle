// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function agent_turn_order(){
	

	var baseList = ds_list_create();
	var masterList = ds_list_create();

	for(var gg = 0; gg < instance_number(obj_actor); gg++){
	    var tempActor = instance_find(obj_actor, gg); 
		ds_list_add(baseList, tempActor);
	}
	
	sort_by_speed(baseList, 0, ds_list_size(baseList) - 1); 
	


	return masterList;
	ds_list_destroy(masterList); 
	ds_list_destroy(baseList); 
	

	
	
}