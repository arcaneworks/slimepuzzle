// checks if node is in bounds on the map
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function in_bounds(xPos, yPos){
	var inBounds = false;
	var yy = yPos;
	var xx = xPos; 
	
	var lBound = 0; //boundry on left side of map
	var rBound = map_width; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side

	if(xx >= lBound && xx < rBound && yy >= bBound && yy < tBound){
		
		inBounds = true;
	}
	
	return inBounds
}