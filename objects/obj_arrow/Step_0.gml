
//if the movement path is set (need more elegant way to do this)


	if(collision_point(x, y, obj_bonfire, false, false)){
			sprite_index = spr_arrow_fire;
			damageType = "fire";
			giveStatus = "burning";
			actor.action.damage.tempDamageType = "fire";
		    damage ++; 
			
	}	
	var collided_director = collision_point(x, y, obj_director, false, false);
	if(collided_director && collided_director.class != "director_fire" && damageType == "fire"){
			var burnable = collided_director;
 			var newBonfire = instance_create_layer(burnable.x, burnable.y, "Instances", obj_director_fire);
			audio_play_sound(s_fire4, 1, false);
			newBonfire.dead = true;
			var tempStruct = snap_deep_copy(newBonfire.componentStruct);
			
			copy_component_to_struct(newBonfire,tempStruct);
			ds_priority_add(newBonfire.undoList, tempStruct, global.totalMoves);
			newBonfire.dead = false;
			
			
			copy_component_to_struct(burnable,tempStruct);
			ds_priority_add(burnable.undoList, tempStruct, global.totalMoves);
			newBonfire.gridX = burnable.gridX;
			newBonfire.gridY = burnable.gridY;
			newBonfire.facingDir = burnable.facingDir;
            newBonfire.redirect = burnable.redirect;
            newBonfire.targetedBy = burnable.targetedBy;
			ds_list_clear(actor.targetList);
			ds_list_add(actor.targetList, newBonfire);
			//actor.target = newBonfire;
			map[burnable.gridX, burnable.gridY].occupant = newBonfire; 
			burnable.dead = true;
		
	}	
	
	if(damageType == "fire"){
		
		if(collision_point(x, y, obj_bonfire_off, false, false)){
			var burnable = collision_point(x, y, obj_bonfire_off, false, false);
			var newBonfire = instance_create_layer(burnable.x, burnable.y, "Instances", obj_bonfire);
			audio_play_sound(s_fire4, 1, false);
			map[burnable.gridX, burnable.gridY].terrain = newBonfire; 
			newBonfire.dead = true;
			
			var tempStruct = snap_deep_copy(newBonfire.terrainStruct);
			
			copy_terrain_to_struct(newBonfire,tempStruct);
			ds_priority_add(newBonfire.undoList, tempStruct, global.totalMoves);
			newBonfire.dead = false;
			tempStruct = snap_deep_copy(burnable.terrainStruct);
			copy_terrain_to_struct(burnable,tempStruct);
			ds_priority_add(burnable.undoList, tempStruct, global.totalMoves);
			burnable.dead = true;
			
		}
		if(collision_point(x, y, obj_fire, false, false)){
			var burnable = collision_point(x, y, obj_fire, false, false);
			audio_play_sound(s_fire4, 1, false);
			map[burnable.gridX, burnable.gridY].terrain = noone; 
			var tempStruct = snap_deep_copy(burnable.terrainStruct);
			copy_terrain_to_struct(burnable,tempStruct);
			ds_priority_add(burnable.undoList, tempStruct, global.totalMoves);
			burnable.dead = true;
		}
		
		if(collision_point(x, y, obj_web, false, false)){
			var burnable = collision_point(x, y, obj_web, false, false);
			audio_play_sound(s_fire4, 1, false);
			map[burnable.gridX, burnable.gridY].terrain = noone; 
			var tempStruct = snap_deep_copy(burnable.terrainStruct);
			copy_terrain_to_struct(burnable,tempStruct);
			ds_priority_add(burnable.undoList, tempStruct, global.totalMoves);
			burnable.dead = true;
			
		}
	}
