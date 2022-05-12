// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fill_reaction_list(list, reactionType, range){
	var oX = gridX;
	var oY = gridY;
	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height - 1; //top side
	ds_list_clear(list);
	
	switch(reactionType){
		
		case "melee":
			for(var xx = oX - range; xx <= oX + range; xx++){
				if(xx >= lBound && xx <= rBound){
					if(xx < oX){
						ds_list_add(list, map[xx, oY]);
					}
					
					if(xx > oX){
						ds_list_add(list, map[xx, oY]);
					}
					map[xx, oY].actionNode = true;
				}
			}
			
			for(var yy = oY - range; yy <= oY + range; yy++){
				if(yy >= bBound && yy <= tBound){	
					
					if(yy < oY){
						ds_list_add(list, map[oX, yy]);
					}		
					if(yy > oY){
						ds_list_add(list, map[oX, yy]);
					}		
					map[oX, yy].actionNode = true;
				}				
			}
			
			map[oX, oY].actionNode = false;
		break;
		
	}
	
	
}