// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_object_place(){
	if(selectedObjTool != noone && hoverNode != noone){
		
		if(selectedObjTool.component || selectedObjTool.element){
			if(hoverNode.occupant == noone){
				if(select_pressed()){
					
					var newInstance = instance_create_layer(hoverNode.x, hoverNode.y, "Instances", obj_bare_component);
					
					set_component_info(selectedObjTool.componentStruct, newInstance);
					newInstance.gridX = hoverNode.gridX;
					newInstance.gridY = hoverNode.gridY;
					if(selectedObjTool.faces){
						newInstance.facingDir = selectedObjTool.facingDir;	
						hoverNode.componentCode = newInstance.componentCode + string(newInstance.facingDir);		
					}else{
						newInstance.componentCode = selectedObjTool.componentCode;
						hoverNode.componentCode = newInstance.componentCode;
					}
					hoverNode.occupant = newInstance;
				}	
			}
		}
		
		
		if(selectedObjTool.terrain){
			if(hoverNode.terrain == noone){
				if(select_pressed()){
					
					var newInstance = instance_create_layer(hoverNode.x, hoverNode.y, "Instances", obj_bare_terrain);
						newInstance.terrainCode = selectedObjTool.terrainCode;
						get_terrain_info(newInstance, newInstance.terrainCode);
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