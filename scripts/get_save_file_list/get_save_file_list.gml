// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_save_file_list(){
	//initialize working variables
	var fileCount = 0;
	var directoryLocation = working_directory + "saves/*";
	var fileName = file_find_first(directoryLocation,0);
	var fArray = array_create(0);
	// get all the filenames in the save folder
	while(fileName != ""){
		fArray[fileCount] = fileName;
		fileName = file_find_next();
		fileCount++;
	}
	// cleanup file_find
	file_find_close();
	
	// create a priority list to sort the saves chronologically
	var priorityList = ds_priority_create();
	for(xx = 0; xx < array_length(fArray); xx++){
		// get the filename
		fileName = fArray[xx];
		var tempName = "saves\\" + fileName;
		// we know it exists but lets just make sure in case some bullshit happened
		if(file_exists(tempName)){
			// make the buffer
			var _buffer = buffer_load(tempName);
			// pull the string from the buffer
			var _string = buffer_read(_buffer, buffer_string);
			// clean up the buffer
			buffer_delete( _buffer);
			// parse the json
			var _loadData = json_parse(_string);
			// get the saveDate to set the priority for the filename
			var priority = _loadData.saveDate;
			// add the filename to the priority queue with the saveData
			ds_priority_add(priorityList, fileName, priority);
		}
	}
	
	// now turn the priority queue into a normal array we can access all willy nilly
	for(xx = 0; xx < array_length(fArray); xx++){
		// find the newest thing
		var tempFile = ds_priority_find_max(priorityList);
		// slap it in the array
		fArray[xx] = tempFile;
		// remove the newest file from the queue so we can continue
		ds_priority_delete_max(priorityList);
	}
	//destroy the now empty queue
	ds_priority_destroy(priorityList);
	// send the array out to whoever asked for it.
	return fArray;
}