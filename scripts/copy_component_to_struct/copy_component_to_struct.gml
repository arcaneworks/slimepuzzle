// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function copy_component_to_struct(component, struct){
		var comp = component;
		var s = struct;
		s.info.class = comp.class;
		s.info.damageClass = comp.damageClass; 
		s.info.infoText = comp.infoText;
		s.info.componentCode = comp.componentCode;
		s.info.name = comp.name;
		s.info.xPos = comp.x; 
		s.info.yPos = comp.y;
		s.info.gridX = comp.gridX; 
		s.info.gridY = comp.gridY;
		s.info.canAct = comp.canAct; 
		s.info.canMove = comp.canMove;
		s.info.dead = comp.dead;
		s.info.facingDir = comp.facingDir ;
		s.info.alpha = comp.alpha;
		
		s.stats.maxHp = comp.maxHp;
		s.stats.maxHp = comp.hp;
		s.stats.move = comp.move; 
		s.stats.SPD = comp.SPD;
		s.stats.diagonal = comp.diagonal;
	
		s.feats.triggersReaction = comp.triggersReaction;
		s.feats.faces = comp.faces
		s.feats.damagable = comp.damagable
		s.feats.movable =comp.movable 
		s.feats.reacts = comp.reacts
	
		s.visuals.sprite = comp.sprite_index;
		s.visuals.portraitSpr = comp.portraitSpr;
		s.action = comp.action;
	
}

