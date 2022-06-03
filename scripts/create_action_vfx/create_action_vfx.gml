 function create_action_vfx() {
		if(target != noone && instance_exists(target)){
			var aStruct = action; //action struct of actor
			
			
			//if(target.vehicle){			
			//	targetNode = target.vfxNode;
			//}else{
				targetNode = map[target.gridX, target.gridY]; //animation goes to node, not node occupant (helps with components taking up multiple nodes)		
			//}
			
			//if(target.node){
			//	if(target.occupant != noone && target.occupant.hitable){
			//		target = target.occupant;	
			//	}	
			//}
			
				switch(aStruct.vfx.vfxType){
					
		
					case "target node":
						 vfx = instance_create_layer(targetNode.x + 16, targetNode.y + 16, "Instances", obj_vfx); //creates vfx object at target node	
						 var t = target; 
						 
						vfx.actor = id;
						vfx.sprite = action.vfx.vfxSprite;
						//destroys self on sprite animation completion
						 //asigns the sprite
			
		
					break;
		
		
					case "projectile":
	
						attackDir = point_direction(x + node_radius, y + node_radius, targetNode.x + node_radius, targetNode.y + node_radius);
						startX =  x +  node_radius + lengthdir_x(15, attackDir);
						startY =  y +  node_radius + lengthdir_y(15, attackDir);
				
						vfx = instance_create_layer(startX, startY, "Instances", obj_arrow);
						
						with(vfx){
						
							target = other.targetNode; //assigns cursor target variable to projectile
							if (other.damageClass == "director" && other.fire){
								sprite_index = spr_arrow_fire;
								damageType = "fire";
								giveStatus = "burning";
								other.action.damage.tempDamageType = "fire";
								
							}else{
								sprite_index = other.action.vfx.vfxSprite;		
							}
							direction = point_direction(other.startX, other.startY, target.x, target.y);
							actor = other.id;
						
							path_add_point(movementPath, other.startX, other.startY, 100);
							path_add_point(movementPath, target.x + node_radius, target.y + node_radius, 100);
							path_start(movementPath, speed/2, true, true);
						}
				
					break;	
		
					case "melee":
							attackDir = point_direction(x + node_radius, y + node_radius, targetNode.x + node_radius, targetNode.y + node_radius);
							startX =  x +  node_radius + lengthdir_x(15, attackDir);
							startY =  y +  node_radius + lengthdir_y(15, attackDir);
				
							vfx = instance_create_layer(startX, startY, "Instances", obj_dagger);

							with(vfx){
						
								target = other.targetNode; //assigns cursor target variable to projectile
								sprite_index = other.action.vfx.vfxSprite;					
								depth = other.depth - 1; 
								//if(other.miss){
								//	var endX = target.x + node_size;
								//	var endY = target.y + node_radius;
								//}else{
									
									var endX = target.x + node_radius;
									var endY = target.y + node_radius;
								
								//}
								
								path_add_point(movementPath, other.startX, other.startY, 50);
								path_add_point(movementPath, endX, endY, 50);
								path_start(movementPath, speed/2, true, true);
							}
					
		
					break;
						
				}
				
		targetNode = noone;
		
	}
}
