path_delete(movementPath);
apply_terrain(id, map[gridX, gridY]);
trigger_enemies();
trigger_effect_node(); 

if(ds_queue_size(global.gameObj.actionQueue) > 0){
	global.gameObj.actionState = "standby";
}	

moveState = "idle";
if(shoved){
	if(hasReaction){
		react = true; 	
	}
	shoved = false;	
}else{
	canMove = false;
}

push = false;

for(var gg = 0; gg < instance_number(obj_enemy); gg++){
	var tempEnemy = instance_find(obj_enemy, gg); 
	
	if(tempEnemy.hp > 0 && !incapacitated){
		enemy_reaction(tempEnemy);
	}

}
if(ds_queue_empty(global.gameObj.actionQueue)){
	if(global.cursor.selectedActor == id){	
		if(canAct){
			global.cursor.state = "action target";
			if(incapacitated){
				global.cursor.getTargets = false; 
			}else{
				global.cursor.getTargets = true;	
			}
		}else{
			global.cursor.selectedActor = noone;
			global.cursor.state = "idle";
		}
	}
}else{
	queueWait = true;
}
	
