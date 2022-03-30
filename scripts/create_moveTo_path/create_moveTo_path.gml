// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_moveTo_path(){
	
	if(path_exists(movementPath)){ //cleans up movementPath in case one already exists
		path_delete(movementPath); 		
	}
	
	movementPath =  path_add(); //add path of movementPath
	path_set_kind(movementPath, 2);
	path_set_closed(movementPath, false);
	path_add_point(movementPath, x, y, 100);
	path_add_point(movementPath, moveToNode.x, moveToNode.y, 100);
	
}