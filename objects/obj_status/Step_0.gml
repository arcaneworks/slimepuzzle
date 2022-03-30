switch(status){
	case "burning":
		sprite = spr_burning;
		sfx = s_fire; 
		
	break;

	
}


if(instance_exists(actor)){ //if there is an actor 
	x = actor.x; 
	y = actor.y;
	
	if(actor.canAct){
		color = c_white;	
	}else{
		color = c_gray;	
	}
	
}else{
		
	instance_destroy();	
}

if(img >= sprite_get_number(sprite)){
		img = 0;
	}else{
		img += imgSpd;
}


