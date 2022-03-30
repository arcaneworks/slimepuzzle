// DESTROYS THE LIST WITHIN A LIST, then the list itself
function ds_list_clear_inner_lists(list){
	for(var kk = 0; kk < ds_list_size(list); kk++){
		var innerList = ds_list_find_value(list, kk);
			ds_list_clear(innerList); 
	}
	
}