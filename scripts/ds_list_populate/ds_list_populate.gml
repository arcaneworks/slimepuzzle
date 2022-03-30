///@func ds_list_populate
///@param list
///@param object
function ds_list_populate(argument0, argument1) {

	var list = argument0;
	var object = argument1;

	for(var kk = 0; kk < instance_number(object); kk++){
		var actor = instance_find(object,kk);				
		ds_list_add(list, actor);				
	}

}
