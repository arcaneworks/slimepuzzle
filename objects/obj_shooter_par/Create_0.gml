event_inherited();
test = true; 
hasTurn = true;
hasReaction = true;
moveState = "idle";
actState = "idle";

facingDir = dir.south; 
class = "shooter";
maxHp = 1; 
hp = maxHp;

portraitSpr = spr_port_shooter_2;
SPD = 6;

action = global.actionDB.spit;
infoText = "This is a " + class + ". " 
