
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

portraitSpr = spr_port_bomb;
action = global.actionDB.explode;

infoText = "This is a " + class + ".";

