
function set_component_info(compDBstruct, comp){
	var s = compDBstruct; // the component struct (within the database) to copy info from
	comp.componentStruct = compDBstruct;
	comp.class = s.info.class;
	comp.damageClass = s.info.damageClass; 
	comp.infoText = s.info.infoText;
	comp.componentCode = s.info.componentCode;
	comp.name = s.info.name;
	
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
	
	comp.sprite_index = s.visuals.sprite; 
	comp.portraitSpr = s.visuals.portraitSpr;
	
	comp.action = s.action;

}