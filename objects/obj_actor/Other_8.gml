path_delete(movementPath);
apply_terrain(id, map[gridX, gridY]); 

moveState = "idle";

if(shoved){
	shoved = false;	
}else{
	canMove = false;
}

for(var gg = 0; gg < instance_number(obj_enemy); gg++){
	var tempEnemy = instance_find(obj_enemy, gg); 
	
	if(tempEnemy.hp > 0 && !incapacitated){
		enemy_reaction(tempEnemy);
	}

}

//wait until potential reactions occur, then action target if canAct
actState = "wait";

	
