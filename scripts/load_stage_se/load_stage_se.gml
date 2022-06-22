
function load_stage_se(filename){

	var fileGrid = load_csv(working_directory + "Stages\\" + filename + ".csv");
	if(fileGrid == -1)
		return;
	var levelStrings = ds_list_create();
	
	var gridHeight = ds_grid_height(fileGrid); 
	
	stageLvArray = array_create(gridHeight -1)
	
	for(var kk = 1; kk < gridHeight; kk++){
		var levelStr = fileGrid[# 0, kk];
		stageLvArray[kk - 1] = levelStr;
		ds_list_add(levelStrings, levelStr);
		
	}
	
	if(instance_exists(obj_level_box)){
		with(obj_level_box){
			level = "empty";	
		
		}
	
	
		for(var ii = 0; ii < ds_list_size(levelStrings);ii++){
		
			var levelBox = ds_list_find_value(obj_stage_editor.levelList, ii); 
			var loadString = ds_list_find_value(levelStrings, ii); 
		
			levelBox.level = loadString;
		}

	}
	
	return stageLvArray;
}