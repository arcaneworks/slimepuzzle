event_inherited();

switch(state){
	
	case "idle":
	
	
	break;
	
	
	case "start path":
	
		//begin moving along path
		path_start(movementPath, moveSpeed, 0, true);

	
		state = "moving";
		
	break;

	case "damage":
		instance_destroy(id);
	
	break; 
	
	
	
	
}