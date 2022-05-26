//destroy the path
path_delete(movementPath);
//apply terrain effects
apply_terrain(id, map[gridX, gridY]);
//trigger any node effects
trigger_effect_node(); 
//reset moveState
moveState = "idle";

