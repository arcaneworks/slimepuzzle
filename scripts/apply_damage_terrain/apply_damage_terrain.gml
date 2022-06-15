// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_terrain(terrain){
	switch(terrain.terrainString){
				
				case "WEB":
					if(action.damage.damageType == "fire"){
						var tempStruct = terrain.terrainStruct;
						copy_terrain_to_struct(terrain, tempStruct);
						ds_priority_add(terrain.undoList, tempStruct, global.totalMoves);
						terrain.dead = true;
						map[terrain.gridX,terrain.gridY].terrain = noone;
						
					}	
				break;
				
				case "BONFIRE OFF":
					if(action.damage.damageType == "fire" || action.damage.tempDamageType == "fire"){
						var newInst = instance_create_layer(terrain.x, terrain.y, "Instances", obj_bonfire);
						var tempStruct = snap_deep_copy(newInst.terrainStruct);
						newInst.dead = true;
						copy_terrain_to_struct(newInst, tempStruct);
						newInst.dead = false;
						ds_priority_add(newInst.undoList, tempStruct,global.totalMoves);
						copy_terrain_to_struct(terrain, tempStruct);
						ds_priority_add(terrain.undoList, tempStruct, global.totalMoves);
						map[terrain.gridX,terrain.gridY].terrain = newInst;
						newInst.gridX = terrain.gridX;
						newInst.gridY = terrain.gridY;
						terrain.dead = true;
						
					}	
				break;
				case "Ice":
					if(action.damage.damageType == "fire" || action.damage.tempDamageType == "fire"){
						
						var tempStruct = terrain.terrainStruct;
						copy_terrain_to_struct(terrain, tempStruct);
						ds_priority_add(terrain.undoList, tempStruct, global.totalMoves);
						map[terrain.gridX,terrain.gridY].terrain = noone;
						terrain.dead = true;
						
					}	
				break;
				case "BONFIRE":
					if(action.damage.damageType == "physical" || action.damage.tempDamageType == "physical"){
						var newInst = instance_create_layer(terrain.x, terrain.y, "Instances", obj_bonfire_off);
						
						newInst.dead = true;
						copy_terrain_to_struct(newInst, tempStruct);
						newInst.dead = false;
						ds_priority_add(newInst.undoList, tempStruct,global.totalMoves);
						copy_terrain_to_struct(terrain, tempStruct);
						ds_priority_add(terrain.undoList, tempStruct, global.totalMoves);
						map[terrain.gridX,terrain.gridY].terrain = newInst;
						newInst.gridX = terrain.gridX;
						newInst.gridY = terrain.gridY;
						terrain.dead = true;
						
					}	
				break;
				
			}
}