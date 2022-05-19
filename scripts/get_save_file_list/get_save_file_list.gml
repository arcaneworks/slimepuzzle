// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_save_file_list(){
	var fileCount = 0;
	var directoryLocation = working_directory + "saves/*";
	var fileName = file_find_first(directoryLocation,0);
	var fArray = array_create(0);
	while(fileName != ""){
		fArray[fileCount] = fileName;
		fileName = file_find_next();
		fileCount++;
	}
	file_find_close();
	
	var priorityList = ds_priority_create();
	for(xx = 0; xx < array_length(fArray); xx++){
		fileName = fArray[xx];
			var tempName = "saves\\" + fileName;
	if(file_exists(tempName)){
		var _buffer = buffer_load(tempName);
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete( _buffer);
		var _loadData = json_parse(_string);
		var priority = _loadData.saveDate;
		ds_priority_add(priorityList, fileName, priority);
	}
	}
	
	
	for(xx = 0; xx < array_length(fArray); xx++){
		var tempFile = ds_priority_find_max(priorityList);
		fArray[xx] = tempFile;
		ds_priority_delete_max(priorityList);
	}
	ds_priority_destroy(priorityList);
	
	return fArray;
}