depth = -4;

hit = false; 
startSfx = s_arrow;
hitSfx = s_impact_hit;
giveStatus = noone;
damageType = "physical";
color = c_white;
damage = 1;

//who the attack is targeting
target = noone;

//owner is who made the attack
owner = noone;

//path information
movementPath = path_add();
path_set_closed(movementPath, false);
path_set_kind(movementPath, 2);


audio_play_sound(startSfx, 0, false);