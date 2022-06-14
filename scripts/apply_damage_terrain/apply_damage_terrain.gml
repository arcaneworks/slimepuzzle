// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_terrain(terrain){
	switch(terrain.terrainString){
				
				case "WEB":
					if(action.damage.damageType == "fire"){
						
						instance_destroy(terrain);
						map[terrain.gridX,terrain.gridY].terrain = noone;
						
					}	
				break;
				
				case "BONFIRE OFF":
					if(action.damage.damageType == "fire" || action.damage.tempDamageType == "fire"){
						var newInst = instance_create_layer(terrain.x, terrain.y, "Instances", obj_bonfire);
						
						map[terrain.gridX,terrain.gridY].terrain = newInst;
						newInst.gridX = terrain.gridX;
						newInst.gridY = terrain.gridY;
						instance_destroy(terrain);
						
					}	
				break;
				case "Ice":
					if(action.damage.damageType == "fire" || action.damage.tempDamageType == "fire"){
						
						map[terrain.gridX,terrain.gridY].terrain = noone;
						instance_destroy(terrain);
						
					}	
				break;
				case "BONFIRE":
					if(action.damage.damageType == "physical" || action.damage.tempDamageType == "physical"){
						var newInst = instance_create_layer(terrain.x, terrain.y, "Instances", obj_bonfire_off);
						map[terrain.gridX,terrain.gridY].terrain = newInst;
						newInst.gridX = terrain.gridX;
						newInst.gridY = terrain.gridY;
						instance_destroy(terrain);
						
					}	
				break;
				
			}
}