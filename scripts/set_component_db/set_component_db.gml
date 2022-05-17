
function set_component_info_db(){
	
	function component_info_struct(_class = "NO CLASS", _infoText = "NO ACTION TEXT", _sprite = spr_knight1_s ,_portSpr = spr_portrait_efrin, _move = 0) constructor {
		class = _class; 
		infoText = _infoText;
		sprite = _sprite;
		portSpr = _portSpr;
		move = _move;
	}
	

	//actors 
	knight = new component_info_struct("knight", "The knight damages and pushes moveable objects, as well as puts out fires.", spr_knight_s, spr_port_knight, 1);
	archer = new component_info_struct("archer", "The archer can shoot over gaps and through fire.", spr_archer_s, spr_port_archer,1); 
	wizard = new component_info_struct( "wizard", "The wizard uses fire to damage and ignite.", spr_wizard_s, spr_port_wizard, 1);
	cleric = new component_info_struct( "cleric", "The cleric rejuvenates allies, regaining their move and action.", spr_cleric_s, spr_port_wizard, 1);
	rogue = new component_info_struct("rogue", "The rogue can move through enemy fields of attack without provoking a reaction", spr_rogue_s, spr_port_archer, 1);
	
	
	//enemies 
	shooter = new component_info_struct("shooter", "The shooter doesn't have an action yet.", spr_shooter_s, spr_port_shooter_2, 1);
	shooterFire = new component_info_struct("shooter", "A shooter that is vulerable to fire.", spr_shooter2_s, spr_port_shooter_2, 1);
	fighter = new component_info_struct("fighter", "The fighter strikes the actor in front of it.", spr_fighter_s, spr_port_fighter_3, 1);
	bomb = new component_info_struct("bomb", "the bomb explodes.", spr_bomb2, spr_port_bomb, 0);
	thumper = new component_info_struct("thumper", "the thumper knocks backs all components adjacent to it.", spr_thumper_s, spr_thumper_s, 1);
	eye = new component_info_struct("eye", "the eye freezes all actors in its field of vision", spr_eye_s, spr_eye_s, 1);
	slime = new component_info_struct("slime", "A useless little slime. Squish it, slash it, or stomp it. It deserves to die.", spr_slime, spr_port_slime, 1);
	//elements 
	
	rock = new component_info_struct("rock", "Rocks can be pushed and fill holes.", spr_rock1, spr_rock1, 1);
	barrel = new component_info_struct("breakable", "barrels can be destroyed.", spr_barrel1, spr_barrel1, 1);
	crate = new component_info_struct("breakable", "crates can be destroyed.", spr_crate1, spr_crate1, 1);
	
	directorLD = new component_info_struct("director", "redirects arrows", spr_directorLD, spr_directorLD, 1);
	directorRD = new component_info_struct("director", "redirects arrows", spr_directorRD, spr_directorRD, 1);
	directorUL = new component_info_struct("director", "redirects arrows", spr_directorUL, spr_directorUL, 1);
	directorUR = new component_info_struct("director", "redirects arrows", spr_directorUR, spr_directorUR, 1);
	
	
	global.componentDB = {
		knight : other.knight,
		archer : other.archer, 
		wizard : other.wizard, 
		cleric : other.cleric,
		rogue : other.rogue,
		
		shooter : other.shooter, 
		shooterFire : other.shooterFire, 
		fighter : other.fighter, 
		bomb : other.bomb,
		thumper : other.thumper,
		eye : other.eye,
		slime : other.slime,
		
		rock : other.rock, 
		barrel : other.barrel,
		crate : other.crate,
		directorLD : other.directorLD, 
		directorRD : other.directorRD,
		directorUL : other.directorUL,
		directorUR : other.directorUR,
		
	}




}
