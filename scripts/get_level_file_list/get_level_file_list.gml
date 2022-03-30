// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_level_file_list(){
	var fileCount = 0;
	var directoryLocation = working_directory + "CGs//" + "level*";
	var fileName = file_find_first(directoryLocation,0);
	var fArray = array_create(0);
	while(fileName != ""){
		fArray[fileCount] = fileName;
		fileName = file_find_next();
		fileCount++;
	}
	
	file_find_close();
	return fArray;
}