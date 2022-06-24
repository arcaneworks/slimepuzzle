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
		target.canAct = false;	
		ds_list_add(victimList, target);
	}
}