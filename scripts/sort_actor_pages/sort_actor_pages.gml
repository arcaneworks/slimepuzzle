// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sort_actor_pages(){
	var pageSize = 5; 
	var listSize = ds_list_size(actorList); 
	actorList1 = ds_list_create();
	actorList2 = ds_list_create();
	
	for(var ii = 0; ii < listSize; ii++){
		
		var actor = ds_list_find_value(actorList, ii);
		
		if(ii <= pageSize - 1){
			ds_list_add(actorList1, actor);	
			
		}
		
		if(ii >= pageSize){
			
			ds_list_add(actorList2, actor); 	
			
		}
	
		
		
		
		
	}
	
	var tempy = 1;
}