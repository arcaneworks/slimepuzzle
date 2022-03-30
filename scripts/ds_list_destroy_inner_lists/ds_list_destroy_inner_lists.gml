// DESTROYS THE LIST WITHIN A LIST, then the list itself
function ds_list_destroy_inner_lists(list){
	for(var kk = 0; kk < ds_list_size(list) - 1; kk++){
		var innerList = ds_list_find_value(list, kk);
		
		ds_list_destroy(innerList); 
	}
	
	ds_list_destroy(list);
}