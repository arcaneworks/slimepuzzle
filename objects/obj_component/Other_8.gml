
path_delete(movementPath);
apply_terrain(id, map[gridX, gridY]);
trigger_enemies();
trigger_effect_node(); 

moveState = "idle";
reaction = true;

