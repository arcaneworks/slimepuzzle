// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function load_stage_set(filename){
	
	var mapStartCol = 3;	 // the first column of the .csv grid that contains node data,
							  // (namely the nodes in leftmost column of the map)
	var fileGrid = load_csv(working_directory + filename + ".csv");
										 // **************************************************
	var hh = ds_grid_height(fileGrid);
	var ww = ds_grid_width(fileGrid);//													 *
	activeCGset = array_create(hh); // CLEARs the SET OF CGs (array of structs,	 *
										 // EACH one containing complete data about one CG.	 *	
										 //													 *
										 // If the game has started, then the new rows	     *
										 // of the GAME MAP are CURRENTLY being generated    *
										 //	out of this set, so modify with care!	 		 *
										 //													 *
										 // RE-INITIALIZES that set so that it can contain	 *
										 // the # of CGs stored in the CG database file.     *
										 //													 *
										 // **************************************************
	
	// the rest of the script creates the CGs and populates them with all data
	// in the spreadsheet.
	
	var rowIndex = 0; // the row currently being examined
					  // skips first row, since that's just file header info
	
	var processedCGcount = 0;
	
	for(var xx = 0; xx < hh; xx++){

			// POPULATE NODE & COMPONENT DATA for the CG just created
			
			
			var tempString = fileGrid[# 0, xx];
			activeCGset[xx] = tempString; 
			rowIndex ++;
													   
				
				
		 } // end of the process of creating a single CG
		 
	 // end of the process of creating all CGs and loading them
	  // into the active CG set with all .csv file data
	  
	return activeCGset;
	  
} // end of function
			