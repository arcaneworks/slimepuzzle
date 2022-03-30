
function push_into(pushingComp, pushedComp){
	
	if(pushedComp == noone){ // if there is no occupant of northern node
		
		map[pushingComp.gridX, pushingComp.gridY].occupant = noone; //clear current node occupancy
		pushingComp.gridY++; //make gridY one north
		
		pushingComp.moveToNode = map[pushingComp.gridX, pushingComp.gridY]; //that new position is the moveToNode to path to
		pushingComp.moveToNode.occupant = pushingComp; //assign occupancy of moveToNode node
		pushingComp.moveState = "start advance"; //start path to that node
		
		
	}else{// if there is an occupant to the north
		
		var nNeighbor = map[pushingComp.gridX, pushingComp.gridY + 1].occupant; 
		
		push_into(pushedComp, nNeighbor);
	
		
	}
}