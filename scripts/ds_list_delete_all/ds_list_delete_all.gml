/// @description ds_list_delete_all(list, value)
/// @param list
/// @param  value
///Remove all instances of a value from a list
function ds_list_delete_all(argument0, argument1) {
	var list = argument0;
	var value = argument1;
	var i = -1;
	do
	{
	    i = ds_list_find_index(list, value);
	    if (i != -1)
	    {
	        ds_list_delete(list, i);
	    }
	}
	until (i == -1);




}
