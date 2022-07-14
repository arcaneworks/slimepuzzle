
function set_component_info(struct, comp, setPos = false){
	
	if(setPos){
		if(map[comp.gridX,comp.gridY].occupant == id){
			map[comp.gridX, comp.gridY].occupant = noone;
		}
	}
	
	var s = struct; // the component struct (within the database) to copy info from
	comp.componentStruct = s;
	comp.class = s.info.class;
	comp.damageClass = s.info.damageClass; 
	comp.infoText = s.info.infoText;
	comp.componentCode = s.info.componentCode;
	comp.name = s.info.name;
	comp.xPos = s.info.xPos; 
	comp.yPos = s.info.yPos; 
	comp.gridX = s.info.gridX; 
	comp.gridY = s.info.gridY
	comp.canAct = s.info.canAct; 
	comp.canMove = s.info.canMove;
	comp.dead = s.info.dead;
	comp.facingDir = s.info.facingDir;
	comp.alpha = s.info.alpha;
	
	comp.maxHp = s.stats.maxHp;
	comp.hp = s.stats.maxHp;
	comp.move = s.stats.move; 
	comp.SPD = s.stats.SPD;
	comp.diagonal = s.stats.diagonal;
	
	comp.triggersReaction = s.feats.triggersReaction;
	comp.faces = s.feats.faces;
	comp.damagable = s.feats.damagable;
	comp.movable = s.feats.movable;
	comp.reacts = s.feats.reacts;
	comp.targetable = s.feats.targetable;
	
	comp.sprite_index = s.visuals.sprite; 
	comp.portraitSpr = s.visuals.portraitSpr;
	comp.action = s.action;
	
	if(setPos){
		
		var node = map[gridX, gridY];
		node.occupant = comp;
		comp.x = node.x;
		comp.y = node.y; 
		comp.currNode = node;
		
	}
	
	if(comp.dead = false){
		comp.deathWait = false; 	
	}

}