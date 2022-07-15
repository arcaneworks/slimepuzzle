// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_action(){
	if(instance_exists(target) && target != noone){ //if the target exists 
		if(target.component){ //and its a component
			if(target.hitable){ //if the target is able to be hit (not a node)
			
				apply_damage_component(target); //apply damage based on target's damage class
				apply_action_effect(target); //apply action effect to target
			}
		}
	}
	action.damage.tempDamageType = action.damage.damageType;
}