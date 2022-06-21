
function save_stage(filename){
	var maxLevels = obj_stage_editor.maxLevels;
	var levelList = obj_stage_editor.drawList;
	// empty array for csv rows
	var csvRows = array_create(maxLevels - 1, "empty");
	//manually filling out the first three columns of each row;
	csvRows[0] = filename + "\n";
	
	for(var ii = 0; ii < ds_list_size(levelList); ii++){
		var level = ds_list_find_value(levelList, ii); 
		
		csvRows[ii +1] = level + "\n"; 
		
	}
	//for (var ii = 0; ii < map_height; ii++) { // for every row in this CG (Y)
	//		for (var jj = 0; jj < map_width; jj++) { // for every node in this row, left-right (X)
	//			// print the content of the row
	//			show_debug_message(csvRows[ii+1]);
	//			var text = "";
	//			//set text based on the component/terrain codes
	//			if(map[jj][ii].componentCode != noone){
	//				text = map[jj][ii].componentCode;
	//			}
	//			if(map[jj][ii].terrainCode != noone){
	//				text += map[jj][ii].terrainCode;
	//			}
	//			//print the text to console
	//			show_debug_message(text);
	//			// add the text to the first three columns of the row and overwrite them.
	//			csvRows[map_height - ii] = csvRows[map_height - ii] + text  + ",";
	//			// add a newline symbol if we're at the end
	//			if(jj == map_width -1)
	//				csvRows[map_height - ii] += "\n";
	//		}
	//	}
			//initialize the save string
			var saveString = "";
			// copy each line of the array to the save string
			for(var k = 0; k <= maxLevels ; k++){
				saveString += csvRows[k];
			}
			
			// create the save buuffer
			var _buffer = buffer_create(string_byte_length(saveString) + 1, buffer_fixed, 1);
			// write the save string to the buffer
			buffer_write(_buffer, buffer_string, saveString);
			// save the buffer to the working directory
			buffer_save(_buffer, "Stages\\" + filename + ".csv");
			// delete the buffer
			buffer_delete(_buffer);
			// print what we saved to the console
			show_debug_message("STAGE" + filename +"  Saved! " + saveString);
		
}