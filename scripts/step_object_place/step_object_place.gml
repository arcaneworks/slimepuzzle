// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_object_place(){
	if(selectedObjTool != noone && hoverNode != noone){
		
		if(selectedObjTool.component || selectedObjTool.element){
			if(hoverNode.occupant == noone){
				if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
					
					var newInstance = instance_create_layer(hoverNode.x, hoverNode.y, "Instances", obj_bare_component);
					newInstance.componentCode = selectedObjTool.componentCode;
					newInstance.sprite_index = selectedObjTool.sprite_index;
					newInstance.gridX = hoverNode.gridX;
					newInstance.gridY = hoverNode.gridY;
					get_component_info(newInstance, newInstance.componentCode)
					hoverNode.occupant = newInstance;
					if(newInstance.faces){
						hoverNode.componentCode = selectedObjTool.componentCode + string(selectedObjTool.facingDir);
					}else{
						hoverNode.componentCode = selectedObjTool.componentCode;
						
					}
				}	
			}
		}
		
		
		if(selectedObjTool.terrain){
			if(hoverNode.terrain == noone){
				if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
					
					var newInstance = instance_create_layer(hoverNode.x, hoverNode.y, "Instances", obj_bare_terrain);
						newInstance.terrainCode = selectedObjTool.terrainCode;
						newInstance.terrainString = selectedObjTool.terrainString; 
						newInstance.sprite_index = selectedObjTool.sprite_index;
						newInstance.gridX = hoverNode.gridX;
						newInstance.gridY = hoverNode.gridY;
					
						if(newInstance.terrainCode == "L"){
							newInstance.depth = -4;	
						
						}else{
							newInstance.depth = -1;	
						}
					
					hoverNode.terrain = newInstance;
					hoverNode.terrainCode = selectedObjTool.terrainCode
				}
			}	

		}
		
		
	}
}