bgSprite = spr_frame;
frameWidth = 15;
frameHeight = 10; 

levelBoxSize = 32; 
font = f_battle_text_28;
xBuffer = 2; 
yBuffer =1.5;
maxLevels = 30;
maxLevelW = 5; 
maxLevelH = maxLevels/maxLevelW;

globalvar stageMap;
stageMap[maxLevelW - 1, maxLevelH - 1] = "empty";

width =  maxLevelW * levelBoxSize * xBuffer; 
height =  maxLevels/maxLevelW * yBuffer * levelBoxSize;
selectedBox = noone;
levelList = ds_list_create();
drawList = ds_list_create();
levelNumbers = ds_list_create();
for(var ii = 1; ii <= maxLevels ; ii++){
	
	var levelX = x + frameWidth + (((ii - 1) mod maxLevelW) * levelBoxSize * xBuffer);
	var levelY = y + frameHeight + floor((ii - 1)/maxLevelW) * yBuffer * levelBoxSize;
	var levelBox = instance_create_layer(levelX, levelY, "Instances", obj_level_box);
	levelBox.levelSlot = ii;

	
	if(ii < 10){
		var space = "  ";
	}else{
		var space = "";
	}
	ds_list_add(levelList, levelBox);
	ds_list_add(levelNumbers, string(ii) + space + " - ");
	
}

levelLoadBox = instance_create_layer(x + width + 10, y, "Instances", obj_level_load_se);
saveBox = instance_create_layer(0, 0, "Instances", obj_saveas_se);
stageLoadBox = instance_create_layer(x, y, "Instances", obj_stage_load_se);
