depth = -200;
initialize = true;
hotKey = "Z";
canAct = true;
//UI Visuals (bottom left corner)
sprite = sprite_index;

bgColor = c_teal;
bgAlpha = .75;

frameColor = c_white;
frameWidth = .8 *obj_portrait.portraitWidth ;
frameHeight = .5 * obj_portrait.portraitHeight ;

buffer = .1 * frameWidth;

iconSpr = spr_fire_sm;
iconScale = 1;
iconWidth = sprite_get_width(iconSpr);
iconHeight = sprite_get_height(iconSpr);

title = "TITLE";
titleWidth = string_width(title);
titleHeight = string_height(title);

infoText = "no infoText assigned";

y = obj_portrait.y;
x = obj_portrait.x + obj_portrait.portraitWidth;
