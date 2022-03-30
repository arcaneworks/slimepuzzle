
event_inherited();

hasTurn = false;
hasReaction = true;
moveState = "idle";
actState = "idle";
bomb = true;

class = "bomb";
maxHp = 2; 
hp = maxHp;

action = global.actionDB.explode;

infoText = "This is a " + class + ".";

