// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_reaction(enemy){
	//return if the enemy already went this reaction cycle
	if(!enemy.canAct)
		return;
	// set map constants
	var rBound = map_width - 1; //right side
	var tBound = map_height; //top side
	// set originNode to enemy position
	originNode =  map[ enemy.gridX, enemy.gridY];
	// get action
	var aStruct = enemy.action;
	//clear nodes
	wipe_nodes();
	// get attack info
	var targetType = "melee";
	var attackRange = 1;
	var thump = false;
	var stun = false;
	// make sure our reactor has an action
	if(aStruct != noone){
		//get information from the reactor's action
		if(aStruct.targeting.targetType != noone)
			targetType = aStruct.targeting.targetType;
		if(aStruct.targeting.range != noone)
			attackRange = aStruct.targeting.range;
	}
	//TODO replace these if statements with something more good
	if(aStruct.info.title == "THUMP")
	{
		thump = true;
	}
	if(aStruct.info.title == "STUN")
	{
		stun= true;
	}
	// set the action nodes for the reactor's action
	action_nodes(originNode, targetType, attackRange);
	// check all of the tiles
	for(xx = 0; xx <= rBound; xx++){
		for (yy=0; yy < tBound; yy++){
			//if it's an action node and it's got an occupant who triggers reactions, lets go
			if(map[xx,yy].actionNode && map[xx,yy].occupant && map[xx,yy].occupant.triggersReaction && (thump || map[xx,yy].occupant == global.cursor.selectedActor)){
					// set the target
					enemy.target = map[xx,yy].occupant;
					enemy.target.targeted = true;
					// add target to the targetlist
					ds_list_add(enemy.targetList, enemy.target);
					// apply stun effect
					if(stun)
						enemy.target.canAct = false;
					// clear action nodes
					wipe_nodes();
					// set states
					state = "nothing";
					enemy.actState = "action standby";
					// disable enemy actions until next reaction round
					enemy.canAct = false;
					// add action to the global queue
					ds_priority_add(global.actionQueue, enemy, enemy.SPD);
			}
		}
	}
	
}
