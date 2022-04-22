
event_inherited();

hasTurn = false;
hasReaction = true;
moveState = "idle";
actState = "idle";
bomb = true;
damageClass = "bomb";
class = "bomb";
maxHp = 1; 
hp = maxHp;

action = global.actionDB.explode;

infoText = "This is a " + class + ".";

