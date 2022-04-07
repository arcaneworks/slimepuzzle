// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function display_move_nodes(originNode){
	var oNode = originNode;
	var oX = oNode.gridX;
	var oY = oNode.gridY;
	var dirNum = 4; //number of directions the target
	var lBound = 0; //boundry on left side of map
	var rBound = map_width; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side
	var moveRange = 1;
	if( originNode.occupant != -4)
		moveRange = originNode.occupant.move;
	for(var xx = oX - moveRange; xx <= oX + moveRange; xx++){
		if(xx >= lBound && xx < rBound){
			if(xx < oX){
				if(map[xx, oY].occupant == noone){
					map[xx, oY].moveNode = true;
				}
			}
					
			if(xx > oX){
				if(map[xx, oY].occupant == noone){
					map[xx, oY].moveNode = true;
				}
			}		
		}
	}
	
	for(var yy = oY - moveRange; yy <= oY + moveRange; yy++){
		if(yy >= bBound && yy < tBound){	
			if(yy < oY){
				 if(map[oX, yy].occupant == noone){
					map[oX, yy].moveNode = true;
				}
			}
					
			if(yy > oY){
				if(map[oX, yy].occupant == noone){
					map[oX, yy].moveNode = true;
				}
			}
					
				
		}
	}
}