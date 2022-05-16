
event_inherited();
hasTurn = true;
target = noone;
attackTarget = false;
acted = false; 
actState = "player turn";
hasReaction = true;
vfx = noone;
beginX = noone;
beginY = noone;
faces = true;
class = "fighter";
portraitSpr = spr_port_fighter_3;
initialize = true;

maxHp = 5;
hp = maxHp;

inRange = false;

range = 1; 
SPD = 5;

action = global.actionDB.counter;

infoText = "This is a " + class + ".";






