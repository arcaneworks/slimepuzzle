switch(terrainString){
	case "FIRE":
		depth = obj_actor.depth - 1;
	break; 
	
	case "HOLE":
		depth = obj_node.depth + 1;
	break;
	
	case "WEB":
		depth = obj_node.depth -1 ;
	break;
	
	case "BONFIRE OFF":
		depth = obj_node.depth + 1 ;
	break;
	case "BONFIRE":
		depth = obj_node.depth - 1 ;

	break;
}