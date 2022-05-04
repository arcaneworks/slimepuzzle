event_inherited();
turnCt = 1; 
SPD = 9; 
canAct = true;
name = "Efrin"
class = "wizard"
move = 1;

maxHp = 2;
hp = maxHp;
portraitSpr = spr_port_wizard;

action = global.actionDB.fire;

infoText = "This is " + name + ", the " + class + ". " + "Their action is " + action.info.title + ". " + action.info.actionText;