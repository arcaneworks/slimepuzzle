// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function auto_gen_mapname(directory, nameSeed){
    var ct = 0; // number of files with this nameSeed we've found
    var file = file_find_first(working_directory + "CGs/*", 0); 
	
    while (file != "") {
		var levelString = string_copy(file, 1, 5);
		
		if(levelString == nameSeed){
			ct++
			file = file_find_next();
		}else{
			
			 file = file_find_next();
		}
    }
    file_find_close();
    return nameSeed + string(ct);
}

