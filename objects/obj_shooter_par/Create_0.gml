event_inherited();
test = true; 
hasTurn = true;
moveState = "idle";
actState = "idle";


class = "shooter";
maxHp = 1; 
hp = maxHp;

SPD = 6;

action = global.actionDB.spit;
infoText = "This is a " + class + ". " 
