function trigger_effect_node() {
	if(map[gridX, gridY].effect != noone){
		var tempStatus = map[gridX, gridY].effect.status;
		status = tempStatus;
		statusCt = 2;
	}
}
