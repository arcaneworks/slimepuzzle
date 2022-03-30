// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_CG_set(filename){
	var mapStartCol = 3;
	var csvRows = array_create(map_height + 1);
	csvRows[0] = "1,,,,,,,,,\n";
	csvRows[1] = "name,"+filename+",-,";
	csvRows[2] = "Frequency,1,-,";
	csvRows[3] = "rowCount,7,-,";
	csvRows[4] = "deFsTerrain,grass,-,";
	csvRows[5] = "mirrors,N,-,";
	csvRows[6] = "-,-,-,";
	csvRows[7] = "-,-,-,";
	CGheight = 8;
	show_debug_message(noone);
		for (var ii = 0; ii < map_height; ii++) { // for every row in this CG (Y)
				for (var jj = 0; jj < map_width; jj++) { // for every node in this row, left-right (X)
					show_debug_message(csvRows[ii+1]);
					var text = "";

					if(map[jj][ii].componentCode != noone){
						
						text = map[jj][ii].componentCode;
					}
					
					
					if(map[jj][ii].terrainCode != noone){
						
						text += map[jj][ii].terrainCode;
					}
					
					show_debug_message(text);
					 csvRows[ii + 1] = csvRows[ii + 1] + text  + ",";
					 if(jj == map_width -1)
						csvRows[ii+1] += "\n";
					//componentGrid.cellInfo[jj][ii] = fileGrid[# mapStartCol + jj, rowIndex + ii]; // add the file's cell data to the component grid data structure
					
				}
			}
			var saveString = "";
			for(k = 0; k <CGheight; k++){
				saveString += csvRows[k];
			}
			
			var _buffer = buffer_create(string_byte_length(saveString) + 1, buffer_fixed, 1);
			buffer_write(_buffer, buffer_string, saveString);
			buffer_save(_buffer,  filename + ".csv");
			buffer_delete(_buffer);
			show_debug_message("Level " + filename +"  Saved! " + saveString);
			
}