//set the tile tint based on current status
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

if(terrain != noone){
	//infotext state machine
	if(terrain.terrainStruct != noone){
		infoText = terrain.terrainStruct.info.infoText; 
	}
}else{
	infoText = "No effect.";
	
}

