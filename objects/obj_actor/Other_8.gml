path_delete(movementPath);
moveState = "idle";
apply_terrain(id, map[gridX, gridY]); 



if(hp > 0){
	with(obj_enemy){
		if(hp > 0 && !other.disabled){
			if(componentStruct.feats.reacts){
				if(id != other.id && !other.componentStruct.feats.chases)
					canMove = true;
				fill_reaction_list(reactList, action.targeting.reactionType, action.targeting.range);
				if(other.componentStruct.feats.chases)
					other.canMove = false;
				enemy_reaction_move();
			}
		}
	}
}

if(shoved){
		
	if(object_get_parent(object_index) == obj_enemy){
		if(componentStruct.feats.reacts && hp > 0){
			fill_reaction_list(reactList, action.targeting.reactionType, action.targeting.range); 
			shove_reaction();
		}
		else if (hp <=0){
			if(ds_priority_find_priority(global.actionQueue, id) != undefined || !ds_list_empty(targetList)){
			ds_priority_delete_value(global.actionQueue, id);
			canAct = true;
			ds_list_clear(targetList);}
		}
		
	}
	
	shoved = false;	
}else{
	canMove = false;
}
//for(var gg = 0; gg < instance_number(obj_enemy); gg++){
//	var tempEnemy = instance_find(obj_enemy, gg); 
	
//	if(tempEnemy.hp > 0 && !disabled){
//		enemy_reaction(tempEnemy);
//	}
//}

//wait until potential reactions occur, then action target if canAct
if(!enemy)
	actState = "wait";

	
