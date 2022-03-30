// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function load_CG_set(filename){
	
	var mapStartCol = 3;	 // the first column of the .csv grid that contains node data,
							  // (namely the nodes in leftmost column of the map)
	var fileGrid = load_csv(working_directory + filename + ".csv");
	
	// ensures fileGrid so that it is exactly as wide as the map 
	// (if columns on the right side of the CG file are left blank, they will not be loaded in with the load_csv function)
	var emptyColumns = map_width - (ds_grid_width(fileGrid) - mapStartCol);
	ds_grid_resize(fileGrid,ds_grid_width(fileGrid) + emptyColumns, ds_grid_height(fileGrid)); // fixes size
	
	ds_grid_set_region(fileGrid, // sets all values in new columns to ""
					   ds_grid_width(fileGrid), 
					   0, 
					   ds_grid_width(fileGrid) - emptyColumns, 
					   ds_grid_height(fileGrid) - 1,
					   "");
	
	var fileCGcount = fileGrid[# 0, 0]; // number of CGs in this file

	
										 // **************************************************
										 //													 *
	activeCGset = array_create(fileCGcount); // CLEARs the SET OF CGs (array of structs,	 *
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
	
	var rowIndex = 1; // the row currently being examined
					  // skips first row, since that's just file header info
	
	var processedCGcount = 0;
	
	while ((fileGrid[# 0, rowIndex] != "$") &&  // '$' at the beginning of row marks end of file
	
		  (processedCGcount < fileCGcount)){ // and stop processing the file if we have processed
											// all the CGs it contain.s (This extra check is here just 
											// in case the end of file marker is missing.)

		
		if (fileGrid[# rowIndex, 0] == "/") { // '/' at the beginning of row separates CGs 
			
			rowIndex++; // so immediately advance to next row to load in next CG
	
		} else { // load a new CG!
			
			var CGheight = real(fileGrid[# 1, rowIndex + 2]); // the number of rows in this CG
															  // converted from string to int
			
			// create a CG of that size
			
			var componentGrid = { // contains all info about the CG
				cellInfo : [map_width,CGheight], // 2d array containing all cell info
				name: fileGrid[# 1, rowIndex], // name of CG
				freq : real(fileGrid[# 1, rowIndex + 1]),  // the probability (>0, <=1) that this CG will be generated
				height : CGheight, // # of rows
				terrain : fileGrid[# 1, rowIndex + 3], // the -default- terrain for this CG. can be overridden by cell-specific terrain info 
				mirrors : fileGrid[# 1, rowIndex + 4] // info about whether other 'flipped' versions of this CG should be generated at random.
													// (equal probability of each)
													// four options: "V" (vertical), "H" (horizontal), "HV" (both), or "N" (none)
			};
			
			
			// POPULATE NODE & COMPONENT DATA for the CG just created
			
			for (var ii = 0; ii < CGheight; ii++) { // for every row in this CG (Y)
				for (var jj = 0; jj < map_width; jj++) { // for every node in this row, left-right (X)
					
					
					componentGrid.cellInfo[jj][ii] = fileGrid[# mapStartCol + jj, rowIndex + ii]; // add the file's cell data to the component grid data structure
					
				}
			}
			
			
			activeCGset[processedCGcount] = componentGrid; // *********************
														   // Load in the new CG! *
														   // *********************
			
			if (CGheight > largestCG) largestCG = CGheight; // if this is the biggest one yet,
																// update largestCG!
			rowIndex += CGheight;
													   
			processedCGcount++;	// onto the next one
				
				
		 } // end of the process of creating a single CG
		 
	} // end of the process of creating all CGs and loading them
	  // into the active CG set with all .csv file data
	  
	return activeCGset;
	  
} // end of function
			