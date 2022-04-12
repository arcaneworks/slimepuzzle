// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_reaction(enemy){
	
	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side
	originNode =  map[ enemy.gridX, enemy.gridY];
	aStruct = enemy.action;
	wipe_nodes();
	action_nodes(originNode, aStruct.targeting.targetType, aStruct.targeting.range);
	for(xx = 0; xx <= rBound; xx++){
		for (yy=0; yy < tBound; yy++){
			if(map[xx,yy].actionNode && map[xx,yy].occupant && map[xx,yy].occupant == global.cursor.selectedActor){
					enemy.target = map[xx,yy].occupant;
					ds_list_add(enemy.targetList, enemy.target);
					wipe_nodes();
					state = "nothing";
					enemy.actState = "action standby";
					enemy.canAct = false;
					ds_queue_enqueue(global.gameObj.actionQueue, enemy);
					global.gameObj.actionState = "standby";
			}
		}
	}
	
}