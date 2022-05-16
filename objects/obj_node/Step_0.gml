if(moveNode){
	alpha = .3;
	color = c_aqua;	
}

if(reactNode){
	alpha = .3;
	color = c_orange;	
}

if(passNode){
	alpha = .5;
	color = c_yellow;
}

if(actionNode){
	alpha = .3;
	color = c_red;	
}

if(targetNode){
	alpha = .3;
	color = c_aqua;
}



if(potNode){
	alpha = .3;
	color = c_red;	
}

if(executeNode){
	alpha = .3;
	color = c_red;
}

if(instance_exists(occupant)){
	if(occupant != noone && selected == true){
		occupant.selected = true;	
	}

	
}

if(terrain != noone){
	switch(terrain.terrainString){
	
		case "GROUND":
			infoText = "No effect.";
	
		break;
	
		case "CRACK":
			infoText = "This is a NODE with a CRACK in it. It can be filled with a ROCK or an ENEMY."

		break;
	
		case "HOLE":
			infoText = "ACTORs within HOLES cannot ACT. It can be filled with a ROCK."

		break;
	
		case "FIRE":
			infoText = "ACTORs within FIRE are destroyed immediately."

		break;
		
		case "WEB":
			infoText = "Actors in webs cannot act. Webs can be destroyed with fire or a slashing weapon."

		break;
		
		case "BONFIRE":
			infoText = "Actors within bonfires are destroyed immediately. They can be put out by rocks or melee attacks."

		break;
		
		case "BONFIRE OFF":
			infoText = "Unlit bonfires can be lit by fire based actions."

		break;
	
	}
}else{
	infoText = "No effect.";
	
}

