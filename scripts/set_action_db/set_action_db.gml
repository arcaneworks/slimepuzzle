//creates constructor function and 
function set_action_db(){
	//creates struct containing information about the action (title, actionText, icon sprite, hotkey)
	function info_struct(_title = "NO TITLE", _actionText = "NO ACTION TEXT", _iconSpr = spr_stab_sm, _hotKey = ord("Z"), _instructText = "THIS ACTION HAS NO INSTRUCTION TEXT") constructor {
		title = _title; 
		actionText = _actionText;
		iconSpr = _iconSpr;
		hotKey = _hotKey;
		instructText = _instructText;
	}
	
	//creates struct containing damage variables (damage number, damage type)
	function damage_struct(_damage = 0, _damageType = "physical") constructor {
		damage = _damage;
		damageType = _damageType;
		tempDamageType = _damageType; 
	}
	
	//creates struct containing range and targetType
	function targeting_struct(_range = 1, _targetType = "melee") constructor {
		range = _range; 
		targetType = _targetType; 	
	}
	
	//creats struct containing effect information (shove, rotate)
	function effect_struct(_shove = false, _rotate = false, _status = noone, _rejuvenate = false) constructor {
		shove = _shove;
		rotate = _rotate;	
		status = _status;
		rejuvenate = _rejuvenate;
	}
	
	//creates struct containing vfx and sfx information
	function vfx_struct(_vfxSprite = spr_stab_vfx, _vfxType = "melee") constructor {
		vfxSprite = _vfxSprite;
		vfxType = _vfxType; 
	}
	
	//creates struct containing vfx and sfx information
	function sfx_struct( _startSfx = s_arrow, _endSfx = s_impact_hit) constructor {
		startSfx = _startSfx;
		endSfx = _endSfx;
	}
	
	//creates struct containing action event information
	function event_struct(_eventType = noone) constructor {
		eventType = _eventType;	
	}
	
	//creates the constructor function
	function 
	
	act_struct( 
	
		_info = new info_struct(), 
		_damage = new damage_struct(), 
		_targeting = new damage_struct(), 
		_effect = new effect_struct(),
		_vfx = new vfx_struct(),
		_sfx = new sfx_struct(),
		_event = new event_struct()
		
	) constructor {
	
		info = _info;
		damage  = _damage;
		targeting = _targeting; 
		effect = _effect;
		vfx = _vfx; 
		sfx = _sfx
		actionEvent = _event;
					
	}
	
	//NEW ACTION FORMAT
	//info - title, actionText, iconSpr, hotkey
	//damage - damage number, damage type
	//targeting - range, targetType
	//effect - shove, rotate, status
	//vfx - vfxSprite, vfxType,
	//sfx -  startSfx, endSfx
	//event - eventType
	
	
	#region Action Database
	
	bash = new act_struct();
	with(bash){
		info.title = "BASH";
		info.instructText = "Use precision and press 'Z' to strike!"
		info.actionText = "Deals 1 damage and pushes target 1 node.";
		effect.shove = true;
		targeting.range = 1;
		damage.damage = 1;
		damage.damageType = "physical";
		targeting.targetType = "melee";
		actionEvent.eventType = "sidebar";
	}
	
	shoot = new act_struct(); 
	with(shoot){
		info.title = "SHOOT";
		info.actionText = "Targets up to three nodes in any direction. Ignores Holes."
		info.instructText = "Hold 'Z' and release to shoot!";
		info.iconSpr = spr_shoot_sm;
		effect.rotate = true;
		actionEvent.eventType = "bar";
		targeting.range = 8; 
		targeting.targetType = "bow";
		vfx.vfxType = "projectile";
		vfx.vfxSprite = spr_arrow;
		damage.damage = 1;
	}
		
	fire = new act_struct(); 
	with(fire){
		info.title = "FIRE";
		info.infoText = "Ignites a diagonal node.";
		info.instructText = "Press the buttons in order as they appear on-screen!"
		info.iconSpr = spr_fire_sm;
		damage.damage = 1; 
		damage.damageType = "fire";
		damage.tempDamageType = "fire";
		targeting.range = 1; 
		targeting.targetType = "diagonal";
		actionEvent.eventType = "QTE";
		vfx.vfxSprite = spr_vfx_fire;
		sfx.startSfx = s_fire;
		sfx.endSfx = noone;
	}
	
	counter = new act_struct();
	with(counter){
		info.title = "COUNTER";
		info.infoText = "COUNTER targets components that move into the node in front of the actor."
		damage.damage = 2;	
		targeting.range = 1; 
		targeting.targetType = "melee";
	}
	
	bless = new act_struct(); 
	with(bless){
		info.title = "BLESS"
		info.infoText = "Rejuvenates an actor, making them regain their move and action.";
		info.iconSpr = spr_bless_sm;
		vfx.vfxSprite = spr_shield_energy;
		vfx.vfxType = "target node";
		effect.rejuvenate = true; 
		sfx.startSfx = s_bless;
		targeting.range = 1; 
		targeting.targetType = "diagonal";
		sfx.endSfx = noone;
	}
	
	spit = new act_struct();
	with(spit){
		info.title = "SPIT";
		info.infoText =  "SPIT shoots a projectile up to three nodes in their facing direction. Deals one damage."
		info.iconSpr = spr_shoot_sm;
		targeting.targetType = "line";
		targeting.range = 3; 
		damage.damage = 1;
		vfx.vfxSprite = spr_arrow;
		vfx.vfxType = "projectile";
	}
	
	explode = new act_struct();
	with(explode){
		info.title = "EXPLODE";
		info.infoText = "SELF-DESTRUCTS self and damages adjacent nodes.";
		damage.damageType = "fire";
		targeting.targetType = "adjacent";
		vfx.vfxSprite = spr_nuke_explode;
		vfx.vfxType = "target node";
		sfx.startSfx = s_explode;		
		targeting.targetType = "melee";
		targeting.range = "1";		
	}
	
	global.actionDB = {
		
		shoot : other.shoot,
		bash : other.bash,
		fire : other.fire,
		counter: other.counter,
		spit: other.spit,
		explode : other.explode,
		bless : other.bless
		
	}


#endregion


}

