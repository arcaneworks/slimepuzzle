draw_sprite_ext(portraitSpr, portraitImg, x, y , scale, scale, 0, c_white, 1);
draw_resizable_ext(spr_frame, x, y, portraitWidth, portraitHeight, 0, 0);



#region DRAWS frame and background 
var frameSprite = spr_frame;
var bgAlpha = .85;

var buffer = 8;

var actBoxW = .8 * portraitWidth; //width of the frame containing the action box
var actBoxH = .5 * portraitHeight;

var actBoxX = x + portraitWidth;
var actBoxY = y + actBoxH;
var frameColor = c_black;

var pActor = noone;
if(interface.selectedActor != noone)
	pActor = interface.selectedActor;
else if(interface.hoverNode.occupant != noone)
	pActor = interface.hoverNode.occupant;
if(pActor != noone && pActor.hpSec1 != noone){
	var hpSec1 = pActor.hpSec1;
	var hpSec2 = pActor.hpSec2;
	var hpSec3 = pActor.hpSec3;
	var fillSpr = pActor.fillSpr;
	
	var maxHp = pActor.maxHp;
	var hp = pActor.hp;
	
	var barWidth = valuebar_get_width(hpSec1, hpSec2, hpSec3, maxHp);
	var barHeight = sprite_get_height(hpSec1);
	draw_valuebar_sectioned(spr_valuebar_section1, spr_valuebar_section2, spr_valuebar_section3, spr_valuebar_fill_red, x + portraitWidth , y +.5 * portraitHeight - barHeight , node_size/8, maxHp, hp, 0, c_white, 1,1);
	
}
var title = action1.info.title;
var titleWidth = string_width(title);

draw_set_color(bgColor);
draw_set_alpha(bgAlpha);

draw_rectangle(actBoxX, actBoxY, actBoxX + actBoxW, actBoxY + actBoxH , false);

draw_set_color(frameColor);
draw_set_alpha(1);

draw_resizable_ext(frameSprite, actBoxX, actBoxY, actBoxW, actBoxH, 0, 0);

draw_set_color(c_white);

#endregion
#region Draws Icon, Title, and Hotkey




var iconSpr = action1.info.iconSpr;
var iconWidth = sprite_get_width(iconSpr);
var iconHeight = sprite_get_height(iconSpr);
var iconX = actBoxX + buffer;
var iconY = actBoxY + .5 * actBoxH - .5 * iconHeight + buffer;
draw_sprite(iconSpr, 0, iconX , iconY);

draw_set_font(f_battle_text_10);
	

var hotKeyX = iconX + iconWidth + buffer ;
var hotKeyY = iconY + buffer;


draw_text_shadow(hotKeyX, hotKeyY, "[ " + chr(action1.info.hotKey) + " ]", c_yellow, c_black, .8);

draw_set_font(f_battle_text_10);

var titleWidth = string_width(title)
var titleX = actBoxX + .5 * actBoxW - .5 * titleWidth;
var titleY = actBoxY + buffer;
draw_text_shadow(titleX, titleY, title, c_white, c_black, .8);

if(xMark){
	draw_line_width_color(actBoxX,actBoxY, actBoxX + actBoxW, actBoxY + actBoxH,3, c_red, c_red);	
	draw_line_width_color(actBoxX, actBoxY+ actBoxH, actBoxX + actBoxW, actBoxY,3, c_red, c_red);
}
//scr_draw_resizable(portraitFrame * scale, portraitWidth * scale, portraitHeight, 0, 0, scale);     
 
 #endregion

#region draws turn order

var portraitList = ds_list_create(); 
var gameList = global.gameObj.turnList; 

if(ds_list_size(gameList) > 0){
	for(var ll = 0 ; ll < ds_list_size(gameList); ll++){	
		var tempActor = ds_list_find_value(gameList, ll);
		if(tempActor != noone && tempActor != -1){	
			ds_list_add(portraitList, tempActor);
		}
	}	
var portraitSize = 1.5 * node_size; 

	if(ds_list_size(portraitList) > 0){
		for(var kk = 0; kk < ds_list_size(portraitList); kk++){
			
			var pActor = ds_list_find_value(portraitList, kk);
			
			if(instance_exists(pActor)){
				var pActorSpr = asset_get_index("spr_" + pActor.class + string(dir.south));
				var frameSpr = spr_frame;
			
				var turnOrderY = y - portraitSize - (kk * portraitSize);
				var turnOrderX = x;
			
			
				draw_resizable_ext(frameSpr, turnOrderX, turnOrderY,  portraitSize, portraitSize, 0, 0);
			
				var actorSpriteX = turnOrderX + (portraitSize - pActor.sprite_width)/2 ;
				var actorSpriteY = turnOrderY + (portraitSize - pActor.sprite_height)/2 ;
			
				var oColor = c_white; 
			
				if(pActor == global.gameObj.currActor){
					oColor = c_lime		
				}else{
					oColor = c_white;
				}
							
				draw_sprite_outlined(pActorSpr, 0, actorSpriteX, actorSpriteY, 1, 1, 0, c_white, oColor, 1);
				//draw_sprite_ext(pActorSpr, 0, actorSpriteX, actorSpriteY, 1, 1, 0, c_white, 1);
			
				if(pActor != noone){
					var hpSec1 = pActor.hpSec1;
					var hpSec2 = pActor.hpSec2;
					var hpSec3 = pActor.hpSec3;
					var fillSpr = pActor.fillSpr;
	
					var maxHp = pActor.maxHp;
					var hp = pActor.hp;
	
					var barWidth = valuebar_get_width(hpSec1, hpSec2, hpSec3, maxHp);
					var barHeight = sprite_get_height(hpSec1);
					//draw_valuebar_sectioned(hpSec1, hpSec2, hpSec3, fillSpr, x , y + actBoxH * 4 + barHeight, node_size/8, maxHp, hp, 0, c_white, 1,1);
	
				}
			}
		
		
		}
	}
}

ds_list_destroy(portraitList);


#endregion