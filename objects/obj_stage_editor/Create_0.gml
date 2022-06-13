bgSprite = spr_frame;
frameWidth = 15;
frameHeight = 10; 

levelBoxSize = 32; 

xBuffer = 2; 
yBuffer = 2;
maxLevels = 20;
maxLevelW = 5; 
maxLevelH = maxLevels/maxLevelW;

globalvar stageMap;
stageMap[maxLevelW - 1, maxLevelH - 1] = "empty";

width =  maxLevelW * levelBoxSize * xBuffer; 
height =  maxLevels/maxLevelW * yBuffer * levelBoxSize;
selectedBox = noone;
levelList = ds_list_create();

for(var ii = 1; ii <= maxLevels ; ii++){
	
	var levelX = x + frameWidth + (((ii - 1) mod maxLevelW) * levelBoxSize * xBuffer);
	var levelY = y + frameHeight + floor((ii - 1)/maxLevelW) * yBuffer * levelBoxSize;
	var levelBox = instance_create_layer(levelX, levelY, "Instances", obj_level_box);
	levelBox.levelSlot = ii;
	ds_list_add(levelList, string(levelBox.levelSlot) + "-" + levelBox.level);
	
}

