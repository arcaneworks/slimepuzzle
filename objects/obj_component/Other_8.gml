//destroy the path
path_delete(movementPath);
//apply terrain effects
apply_terrain(id, map[gridX, gridY]);
//trigger any node effects
trigger_effect_node(); 

with(obj_enemy){
	if(hp > 0 && !other.disabled){
		if(componentStruct.feats.reacts){
			fill_reaction_list(reactList, action.targeting.reactionType, action.targeting.range);
			enemy_reaction_move(); 
		}
	}
}
//reset moveState
moveState = "idle";

