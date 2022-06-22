// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function push_to_node(originNode, targetNode){
 //finds the relative position of a target node from an origin node.
var 
oNodeX = originNode.gridX,
oNodeY = originNode.gridY,
tNodeX = targetNode.gridX, 
tNodeY = targetNode.gridY,
xDif = oNodeX - tNodeX,
yDif = oNodeY - tNodeY,
newGridX = tNodeX,
newGridY = tNodeY,
pushNode = originNode;



var lBound = 0; //boundry on left side of map
var rBound = map_width - 1; //right side
var bBound = 0; //bottom side
var tBound = map_height - 1; //top side


if(abs(xDif) > 0 || abs(yDif)){
	xDif = clamp(xDif, -1, 1);
	yDif = clamp(yDif, -1, 1);
	newGridX -= xDif;
	newGridY -= yDif;
	if(newGridX >= lBound && newGridX <= rBound && newGridY >= bBound && newGridY <= tBound)
		pushNode = map[newGridX, newGridY];
}

//if(abs(xDif) > 0 && yDif == 0){ //if there is no change in Y position but there is in an X position
//	if(xDif > 0){ // if the difference between originX and targetX is positive (origin is to the right of target)
//		var dest = tNodeX - 1;
		
//		if(dest >= lBound){ // if dest is on the map
//			pushNode = map[dest, tNodeY]
//		}
		
//	}else{ //if the difference between originX and targetX is negative (origin to to the left of the target)
//		dest = tNodeX + 1;
		
//		if(dest <= rBound){
//			pushNode = map[dest, tNodeY];
//		}
//	}

//}

//if(abs(yDif) > 0 && xDif == 0){ //if there is no change in X position but there is in an Y position
//	if(yDif > 0){ // if the difference between originY and targetY is positive (origin is above target)
		
//		dest = tNodeY - 1; 
		
//		if(dest >= bBound){
//			pushNode = map[tNodeX, dest]
//		}
		
//	}else{ //if the difference between originY and targetY is negative (origin to to the below of the target)
		
//		dest = tNodeY + 1;
		
//		if(dest < tBound){
//			pushNode = map[tNodeX, dest];
//		}
//	}

//}

return pushNode

}

