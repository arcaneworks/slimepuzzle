/// @description Insert description here
// You can writeevent_inherited();
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
class = "eye";
portraitSpr = spr_port_fighter;
initialize = true;

maxHp = 5;
hp = maxHp;

inRange = false;

range = 1; 
SPD = 5;

action = global.actionDB.stun;

infoText = "This is an " + class + ".";

