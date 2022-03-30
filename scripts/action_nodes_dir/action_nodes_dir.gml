///target_nodes(oNode, targetType, range)
///@param oNode
///@param targetType
///@param range
function action_nodes_dir(originNode, targetType, range){
	var oNode = originNode;
	var oX = oNode.gridX;
	var oY = oNode.gridY;
	var lBound = 0; //boundry on left side of map
	var rBound = map_width; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side
	
	var	masterList = ds_list_create(); 
	
	

	switch(targetType){
	
		case "self":
			oNode.actionNode = true;
		break;
	
	
		case "line":
		
			for(var xx = oX - range; xx <= oX + range; xx++){
				if(xx >= lBound && xx < rBound){
					map[xx, oY].actionNode = true;
				}
			}
		
		
			for(var yy = oY - range; yy <= oY + range; yy++){	
				if(yy >= bBound && yy <= tBound){
					map[oX, yy].actionNode = true;			
				}
			}
		
			oNode.actionNode = false;
		
		case "melee":

			for(var xx = oX - 1; xx <= oX + 1; xx++){
				if(xx >= lBound && xx < rBound){
					map[xx, oY].actionNode = true;
				}
			}
	
			for(var yy = oY - 1; yy <= oY + 1; yy++){
				if(yy >= bBound && yy < tBound){		
					map[oX, yy].actionNode = true;		
				}
			}
		
			oNode.actionNode = false;
		
		break;
	
	
		case "adjacent":
			for(var xx = oX - range; xx <= oX + range; xx++){
				for(var yy = oY - range; yy <= oY + range; yy++){	
					if(in_bounds(xx,yy)){
						map[xx, yy].actionNode = true;
					}
				}
			}
		
			oNode.actionNode = false;
	
		break;
	
		case "bow":
			
			var deadZone = 1;
			
			for(var jj = 0; jj < dirNum; jj++){
				var targetListDir = ds_list_create();
				ds_list_add(masterList, targetListDir);	
				
			
			}
				
			for(var yy = oY - deadZone; yy >= oY - deadZone - range; yy--){	
				//node is within boundries
				if(in_bounds(oX,yy)){ 	
					var sList = ds_list_find_value(masterList, dir.south);
					ds_list_add(sList, map[oX, yy]);
					map[oX,yy].actionNode = true;
					
				}
			}
			
			for(var yy = oY + deadZone + range; yy > oY + deadZone; yy--){	
				//node is within boundries
				if(in_bounds(oX,yy)){ 		
					map[oX,yy].actionNode = true;
				}
			}
		
			oNode.actionNode = false;
	
	
	
		break;
		
		case "diagonal":
	
			for(var dist = 1; dist <= range; dist++){

				if(in_bounds(oX + dist, oY + dist)){
					var NEnode = map[oX + dist, oY + dist];
					NEnode.actionNode = true;
				}
				
				if(in_bounds(oX + dist, oY - dist)){
					var SEnode = map[oX + dist, oY - dist];
					SEnode.actionNode = true;
				}
				
				if(in_bounds(oX - dist, oY - dist)){
					var SWnode = map[oX - dist, oY - dist];
					SWnode.actionNode = true;
				}
				
				if(in_bounds(oX - dist, oY + dist)){
					var NWnode = map[oX - dist, oY + dist];	
					NWnode.actionNode = true;
				}
					
			}
			
		break;
	
		
	}

	
	ds_list_destroy_lists(masterList);
}
