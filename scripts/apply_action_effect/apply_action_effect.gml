// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_action_effect(target){
	if(is_string(action.effect.status)){ // give status
		target.status = giveStatus;
	}			
	if(action.effect.rejuvenate){
		target.canAct = true; 
		target.canMove = true;	
	}
	
	if(action.effect.stun){
		//target.canAct = false;	
		//target.canMove = false;
		target.disabled = true;
		ds_list_add(victimList, target);
		wipe_nodes();
	}
	
	if(action.effect.rotate){
		if(target.faces){
			var tempPos = target.facingDir + 1;
			target.facingDir = tempPos mod 4;	
			if(target.componentStruct.feats.reacts){
				with(target){
					fill_reaction_list(reactList, action.targeting.reactionType, action.targeting.range);
					enemy_reaction();
				}
			}
		}
	}
}