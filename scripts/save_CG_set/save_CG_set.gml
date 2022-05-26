// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_CG_set(filename){
	// empty array for csv rows
	var csvRows = array_create(map_height + 1);
	//manually filling out the first three columns of each row;
	csvRows[0] = "1,,,,,,,,,\n";
	csvRows[1] = "name,"+filename+",-,";
	csvRows[2] = "Frequency,1,-,";
	csvRows[3] = "rowCount,7,-,";
	csvRows[4] = "deFsTerrain,grass,-,";
	csvRows[5] = "mirrors,N,-,";
	csvRows[6] = "-,-,-,";
	csvRows[7] = "-,-,-,";
	CGheight = 8;
	for (var ii = 0; ii < map_height; ii++) { // for every row in this CG (Y)
			for (var jj = 0; jj < map_width; jj++) { // for every node in this row, left-right (X)
				// print the content of the row
				show_debug_message(csvRows[ii+1]);
				var text = "";
				//set text based on the component/terrain codes
				if(map[jj][ii].componentCode != noone){
					text = map[jj][ii].componentCode;
				}
				if(map[jj][ii].terrainCode != noone){
					text += map[jj][ii].terrainCode;
				}
				//print the text to console
				show_debug_message(text);
				// add the text to the first three columns of the row and overwrite them.
				csvRows[map_height - ii] = csvRows[map_height - ii] + text  + ",";
				// add a newline symbol if we're at the end
				if(jj == map_width -1)
					csvRows[map_height - ii] += "\n";
			}
		}
			//initialize the save string
			var saveString = "";
			// copy each line of the array to the save string
			for(k = 0; k <CGheight; k++){
				saveString += csvRows[k];
			}
			
			// create the save buuffer
			var _buffer = buffer_create(string_byte_length(saveString) + 1, buffer_fixed, 1);
			// write the save string to the buffer
			buffer_write(_buffer, buffer_string, saveString);
			// save the buffer to the working directory
			buffer_save(_buffer, "CGs\\" + filename + ".csv");
			// delete the buffer
			buffer_delete(_buffer);
			// print what we saved to the console
			show_debug_message("Level " + filename +"  Saved! " + saveString);
		
}