// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_bomb_react_nodes(){

	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side

		var yy = gridY + 1;
			
		if(yy <= tBound){
			var tNode = map[gridX, yy]
			ds_list_add(reactList, tNode);
		}

		
		var xx = gridX + 1; 
			
		if(xx <= rBound){
			var tNode = map[xx, gridY];
			ds_list_add(reactList, tNode);	
		}		

		
		var yy = gridY - 1;
			
		if(yy >= bBound){
			var tNode = map[gridX, yy];
			ds_list_add(reactList, tNode);
		}	

		var xx = gridX - 1; 
			
		if(xx >= lBound){
			var tNode = map[xx, gridY];
			ds_list_add(reactList, tNode);
		}

}