// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_nodes(originNode) {
	var oNode = originNode;
	var oX = oNode.gridX;
	var oY = oNode.gridY;
	var dirNum = 4; //number of directions the target
	var lBound = 0; //boundry on left side of map
	var rBound = map_width; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side
	var moveNodes = global.cursor.moveNodes;
	var moveRange = 1;
	var diagonal = false;
	if( originNode.occupant != -4){
		moveRange = originNode.occupant.move;
		diagonal = originNode.occupant.diagonal;
		}
	ds_list_clear_inner_lists(moveNodes);

	if(!diagonal){
		for(var xx = oX - moveRange; xx <= oX + moveRange; xx++){
			if(xx >= lBound && xx < rBound){
				if(xx != oX){
					var dirList = ds_list_find_value(moveNodes, dir.west);
					if(map[xx, oY].occupant == noone){
						ds_list_add(dirList, map[xx, oY]);
						map[xx, oY].moveNode = true;
					}
				}
					
			
			}
		}
	
		for(var yy = oY - moveRange; yy <= oY + moveRange; yy++){
			if(yy >= bBound && yy < tBound){	
				if(yy != oY){
					var dirList = ds_list_find_value(moveNodes, dir.south);
					 if(map[oX, yy].occupant == noone){
						ds_list_add(dirList, map[oX, yy]);
						map[oX, yy].moveNode = true;
					}
				}
					
				
			}
		}
	}else{
			for(var xx = oX - moveRange; xx <= oX + moveRange; xx++){
				for(var yy = oY - moveRange; yy <= oY + moveRange; yy++){
					if(yy >= bBound && yy < tBound){	
						if(xx >= lBound && xx < rBound){
							if(xx != oX || yy != oY){
								var dirList = ds_list_find_value(moveNodes, dir.west);
								if(map[xx, yy].occupant == noone){
									ds_list_add(dirList, map[xx, yy]);
									map[xx, yy].moveNode = true;
								}
							}
					
			
						}
					}
				}
			}
		}
	}
