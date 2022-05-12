// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_bomb_targets(bombInst){

	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height - 1; //top side
	
		var yy = bombInst.gridY + 1;
			
			
			
			
		if(yy <= tBound){
			var tNode = map[bombInst.gridX, yy]
			ds_list_add(bombInst.targetList, tNode);
		}


		
		var xx = bombInst.gridX + 1; 
			
		if(xx <= rBound){
			var tNode = map[xx, bombInst.gridY];
			ds_list_add(bombInst.targetList, tNode);	
		}		

		
		var yy = bombInst.gridY - 1;
			
		if(yy >= bBound){
			var tNode = map[bombInst.gridX, yy];
			ds_list_add(bombInst.targetList, tNode);
		}	

		var xx = bombInst.gridX - 1; 
			
		if(xx >= lBound){
			var tNode = map[xx, bombInst.gridY];
			ds_list_add(bombInst.targetList, tNode);
		}
		
		ds_list_add(bombInst.targetList, map[bombInst.gridX, bombInst.gridY]);

}