
event_inherited();
hasTurn = true;
target = noone;
attackTarget = false;
acted = false; 
actState = "player turn";
reacts = true;
vfx = noone;
beginX = noone;
beginY = noone;
faces = true;
class = "thumper";
portraitSpr = spr_port_thumper;
initialize = true;

maxHp = 5;
hp = maxHp;

inRange = false;

range = 1; 
SPD = 5;

action = global.actionDB.thump;

infoText = "This is a " + class + ".";






