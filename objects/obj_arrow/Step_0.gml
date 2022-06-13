
//if the movement path is set (need more elegant way to do this)


	if(collision_point(x, y, obj_bonfire, false, false)){
			sprite_index = spr_arrow_fire;
			damageType = "fire";
			giveStatus = "burning";
			actor.action.damage.tempDamageType = "fire";
		    damage ++; 
			
	}	
	var collided_director = collision_point(x, y, obj_director, false, false);
	if(collided_director && damageType == "fire"){
			var burnable = collided_director;
			var newBonfire = instance_create_layer(burnable.x, burnable.y, "Instances", obj_director_fire);
			audio_play_sound(s_fire4, 1, false);
			newBonfire.gridX = burnable.gridX;
			newBonfire.gridY = burnable.gridY;
			newBonfire.facingDir = burnable.facingDir;
            newBonfire.redirect = burnable.redirect;
            newBonfire.targetedBy = burnable.targetedBy;
			map[burnable.gridX, burnable.gridY].occupant = newBonfire; 
			instance_destroy(collided_director); 
		
	}	
	
	if(damageType == "fire"){
		
		if(collision_point(x, y, obj_bonfire_off, false, false)){
			var burnable = collision_point(x, y, obj_bonfire_off, false, false);
			var newBonfire = instance_create_layer(burnable.x, burnable.y, "Instances", obj_bonfire);
			audio_play_sound(s_fire4, 1, false);
			map[burnable.gridX, burnable.gridY].terrain = newBonfire; 
			
			instance_destroy(burnable); 
		}
		if(collision_point(x, y, obj_fire, false, false)){
			var burnable = collision_point(x, y, obj_fire, false, false);
			audio_play_sound(s_fire4, 1, false);
			map[burnable.gridX, burnable.gridY].terrain = noone; 
			
			instance_destroy(burnable); 
			
			
			
			
		}
	}
