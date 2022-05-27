path_delete(movementPath);
apply_terrain(id, map[gridX, gridY]); 

moveState = "idle";

if(shoved){
	shoved = false;	
}else{
	canMove = false;
}

with(obj_enemy){
	if(hp > 0 && !other.disabled){
		if(componentStruct.feats.reacts){
			fill_reaction_list(reactList, action.targeting.reactionType, action.targeting.range);	
			enemy_reaction_move(); 
		}
	}
}
//for(var gg = 0; gg < instance_number(obj_enemy); gg++){
//	var tempEnemy = instance_find(obj_enemy, gg); 
	
//	if(tempEnemy.hp > 0 && !disabled){
//		enemy_reaction(tempEnemy);
//	}

//}

//wait until potential reactions occur, then action target if canAct

actState = "wait";

	
