
function set_component_info_db(){
	
	#region constructors of structs within each component struct
		function component_info_struct(_class = "NO CLASS", _damageClass = "default", _infoText = "NO ACTION TEXT", _componentCode = "NONE", _name = "Osama") constructor{
			class = _class;
			damageClass = _damageClass;
			infoText = _infoText;
			componentCode = _componentCode;
			name = _name;
			xPos = 0; 
			yPos = 0; 
			gridX = 0;
			gridY = 0;
			
			canMove = true;
			canAct = true;
			dead = false;
			facingDir = dir.south;
			disabled = false;
			alpha = 1;
		}
	
		function component_stats_struct(_maxHp = 2, _move = 1, _SPD = 1, _Diagonal = false) constructor{
			maxHp = _maxHp;
			move = _move;
			SPD = _SPD;
			diagonal = _Diagonal;
		}
	
		function component_feats_struct(_triggersReaction = true, _faces = true, _damagable = true, _movable = true, _reacts = false) constructor{
			triggersReaction = _triggersReaction;
			faces = _faces;
			damagable = _damagable; 
			movable = _movable;
			reacts = _reacts;
		}
	
		function component_visuals_struct(_sprite = spr_error0, _portraitSpr = spr_portrait_noone) constructor{
			sprite = _sprite;
			portraitSpr = _portraitSpr
		}
	
	#endregion
	
	function component_struct(
		_info = new component_info_struct(),
		_stats = new component_stats_struct(),
		_feats = new component_feats_struct(), 
		_visuals = new component_visuals_struct(),
		_action = noone
		
	) constructor {
		info = _info;
		stats = _stats;
		feats = _feats; 
		visuals = _visuals;
		action = _action;
	}
	
	//info - class ("NO CLASS"), damageClass (DEFAULT), infoText "no action text", componentCode, name "osama"
	//stats - maxHp (2), move (1), SPD (4
	//feats - triggersReaction (true), faces (true), damagable (true), movable (true)
	//visuals - sprite spr_knight, portraitSprite 
	//action (global.actionDB.(action)) - defaults to noone

	#region AGENTS (player controlled actors)
	
		knight = new component_struct();
		with(knight){
			info.class = "knight";
			info.infoText = "The knight damages and pushes moveable objects, as well as puts out fires.";
			info.componentCode = "CK";
			stats.maxHp = 3;
			visuals.sprite = spr_knight_s;
			visuals.portraitSpr = spr_port_knight; 
			action = global.actionDB.bash;		
			feats.triggersReaction = true;
		}
		
		archer = new component_struct(); 
		with(archer){
			info.class = "archer"; 
			info.infoText = "The archer can shoot over gaps and through fire.";
			info.componentCode = "CA";
			visuals.sprite = spr_archer_s;
			visuals.portraitSpr = spr_port_archer;
			action = global.actionDB.shoot;
		}
	
		wizard = new component_struct();
		with(wizard){
			info.class = "wizard"; 
			info.infoText = "The wizard uses fire to damage and ignite.";
			info.componentCode = "CW";
			visuals.sprite = spr_wizard_s;
			visuals.portraitSpr = spr_port_wizard;
			action = global.actionDB.fire;
		}
	
		cleric = new component_struct();
		with(cleric){
			info.class = "cleric"; 
			info.infoText = "The cleric rejuvenates allies, regaining their move and action.";
			info.componentCode = "CC";
			visuals.sprite = spr_cleric_s;
			visuals.portraitSpr = spr_port_wizard;
			action = global.actionDB.bless;
		}
			
		rogue = new component_struct();
		with(rogue){
			info.class = "rogue"; 
			info.infoText = "The rogue can move through enemy fields of attack without provoking a reaction";
			info.componentCode = "CR";
			visuals.sprite = spr_rogue_s;
			visuals.portraitSpr = spr_port_archer;
			feats.triggersReaction = false;
			action = global.actionDB.bash;
			stats.move = 2;
		}
		
	#endregion
	
	#region ENEMIES
	
		shooter = new component_struct();
		with(shooter){
			info.class = "shooter"; 
			info.infoText = "The shooter fires at actors in front of it.";
			info.componentCode = "CS"
			stats.maxHp = 1;
			visuals.sprite = spr_shooter_s;
			visuals.portraitSpr = spr_port_shooter;
			feats.reacts = true;
			action = global.actionDB.spit;
		}
	
		shooter2 = new component_struct();
		with(shooter2){
			info.class = "shooter2"; 
			info.damageClass = "fire weak";
			info.infoText = "The shooter fires at actors in front of it. Blue shooters are weak to fire.";
			info.componentCode = "CP";
			visuals.sprite = spr_shooter_s;
			visuals.portraitSpr = spr_port_shooter;
			feats.reacts = true;
			action = global.actionDB.spit;
			stats.maxHp = 1;
		}
	
		fighter = new component_struct();
		with(fighter){
			info.class = "fighter"; 
			info.infoText = "The fighter strikes the actor that moves in front of it.";
			info.componentCode = "CF";
			stats.SPD = 2;
			stats.maxHp = 1;
			visuals.sprite = spr_fighter_s;
			visuals.portraitSpr = spr_port_fighter;
			feats.reacts = true;
			action = global.actionDB.counter;
		}
			
		bomb = new component_struct();
		with(bomb){
			info.class = "bomb"; 
			info.damageClass = "bomb";
			info.infoText = "The bomb explodes when exposed to fire, damaging adjacent units.";
			info.componentCode = "CB";
			stats.SPD = 1;
			feats.faces = false;
			stats.maxHp = 1;
			visuals.sprite = spr_bomb2;
			visuals.portraitSpr = spr_port_bomb;
			action = global.actionDB.explode;
		}
		
		thumper = new component_struct();
		with(thumper){
			info.class = "thumper"; 
			info.infoText = "the thumper knocks backs all components adjacent to it.";
			info.componentCode = "CT";
			stats.SPD = 2;
			visuals.sprite = spr_thumper_s;
			visuals.portraitSpr = spr_port_thumper;
			feats.reacts = true;
			action = global.actionDB.thump;
		}
	
		eye = new component_struct();
		with(eye){
			info.class = "eye"; 
			info.infoText = "the eye freezes all actors in its field of vision";
			info.componentCode = "CE";
			stats.SPD = 10;
			visuals.sprite = spr_eye_s;
			visuals.portraitSpr = spr_port_eye;
			feats.reacts = true;
			action = global.actionDB.stun;
		}
		
		slime = new component_struct();
		with(slime){
			info.class = "slime"; 
			info.infoText = "A useless little slime. Squish it, slash it, or stomp it. It deserves to die.";
			info.componentCode = "CX";
			feats.faces = false;
			visuals.sprite = spr_slime;
			visuals.portraitSpr = spr_port_slime;
			action = global.actionDB.slime;
			stats.maxHp = 1;
		}
	
	#endregion

	#region ELEMENTS 
	
		rock = new component_struct();
		with(rock){
			info.class = "rock"; 
			info.infoText = "Rocks can be pushed and fill holes.";
			info.componentCode = "ER";
			feats.faces = false;
			feats.damagable = false;
			visuals.sprite = spr_rock1;
			visuals.portraitSpr = spr_rock1;
		}
		
		wall = new component_struct();
		with(wall){
			info.class = "wall"; 
			info.infoText = "walls cannot be moved or damaged.";
			info.componentCode = "EW";
			feats.faces = false;
			feats.damagable = false;
			feats.movable = false;
			visuals.sprite = spr_wall;
			visuals.portraitSpr = spr_wall;
		}
	
		barrel = new component_struct();
		with(barrel){
				info.class = "breakable"; 
				info.infoText = "barrels can be destroyed.";
				info.componentCode = "EB";
				feats.faces = false;
				visuals.sprite = spr_barrel1;
				visuals.portraitSpr = spr_barrel1;
			}
		
		crate = new component_struct();
		with(crate){
				info.class = "breakable"; 
				info.infoText = "crates can be pushed and destroyed";
				info.componentCode = "EC";
				feats.faces = false;
				visuals.sprite = spr_crate1;
				visuals.portraitSpr = spr_crate1;
			}
	
		director = new component_struct();
		with(director){
				info.class = "director"; 
				info.damageClass = "director";
				info.infoText = "redirects arrows.";
				info.componentCode = "ED";
				feats.damagable = false;
				visuals.sprite = spr_director_s;
				visuals.portraitSpr = spr_director_s;
				action = global.actionDB.shoot;
			}
			
		def = new component_struct();
	
	#endregion
	
	//fills global struct with component structs
	global.componentDB = {
		
		knight : other.knight,
		archer : other.archer, 
		wizard : other.wizard, 
		cleric : other.cleric,
		rogue : other.rogue,
		
		shooter : other.shooter, 
		shooter2 : other.shooter2, 
		fighter : other.fighter, 
		bomb : other.bomb,
		thumper : other.thumper,
		eye : other.eye,
		slime : other.slime,
		
		rock : other.rock, 
		barrel : other.barrel,
		crate : other.crate,
		director : other.director,
		wall : other.wall
	
	}
		
}
