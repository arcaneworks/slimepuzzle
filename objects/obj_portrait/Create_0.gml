#region TEXTBOX VARIABLES

	//-----------Customise (FOR USER)
	playerobject = obj_portrait;
	interact_key = mb_left;
	detection_radius = 32;

	myVoice			= snd_voice1;
	myPortrait		= -1;
	myFont			= fnt_dialogue;
	myFont			= fnt_dialogue;
	myName			= "None";

	myPortraitTalk		= -1;
	myPortraitTalk_x	= -1;
	myPortraitTalk_y	= -1;
	myPortraitIdle		= -1;
	myPortraitIdle_x	= -1;
	myPortraitIdle_y	= -1;

	//-----------Defaults Setup (LEAVE THIS STUFF)
	reset_dialogue_defaults();

#endregion 

portraitSpr = spr_port_knight;
portraitFrame = spr_frame;

scale = 3;

portraitWidth = sprite_get_width(portraitSpr) * scale;
portraitHeight = sprite_get_height(portraitSpr) * scale;
frameImg = 0;
portraitImg = 1;
pActor = noone;
interface = global.cursor;

bgColor = c_olive;
xMark = false;



portraitEndX = y - .5 * portraitWidth;

#region Creates and sets position of ACTIONS 

hotKey = "Z";

	
#endregion 




