bgSprite = spr_frame;
frameWidth = 15;
frameHeight = 10; 

levelBoxSize = 32; 

xBuffer = 1.5; 
yBuffer = 1.5;
maxLevels = 20;
maxLevelW = 5; 


width =  maxLevelW * levelBoxSize * xBuffer; 
height =  maxLevels/maxLevelW * yBuffer * levelBoxSize;


for(var ii = 1; ii <= maxLevels ; ii++){
	
	var levelX = x + frameWidth + (((ii - 1) mod maxLevelW) * levelBoxSize * xBuffer);
	var levelY = y + frameHeight + floor((ii - 1)/maxLevelW) * yBuffer * levelBoxSize;
	
	var levelBox = instance_create_layer(levelX, levelY, "Instances", obj_level_box);
	levelBox.levelSlot = ii;
	
}
