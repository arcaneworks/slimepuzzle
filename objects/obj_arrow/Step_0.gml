
//if the movement path is set (need more elegant way to do this)


	if(collision_point(x, y, obj_bonfire, false, false)){
			sprite_index = spr_arrow_fire;
			damageType = "fire";
			giveStatus = "burning";
			actor.action.damage.tempDamageType = "fire";
			
	}	
	
	
	if(damageType == "fire"){
		if(collision_point(x, y, obj_bonfire_off, false, false)){
			var burnable = collision_point(x, y, obj_bonfire_off, false, false);
			var newBonfire = instance_create_layer(burnable.x, burnable.y, "Instances", obj_bonfire);
			audio_play_sound(s_fire4, 1, false);
			map[burnable.gridX, burnable.gridY].terrain = newBonfire; 
			
			instance_destroy(burnable); 
			
			
			
			
		}
	}
