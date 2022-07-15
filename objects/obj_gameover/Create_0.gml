skipGameOver = true;

//obj_level.visible = false; //make level UI invisible
oldString = global.gameObj.levelString; //find old level string

if(!skipGameOver){
	instance_deactivate_all(true); //deactive all the objects
	instance_activate_object(obj_level); //except for the persistant level object
	instance_activate_object(obj_camera);
}

newRoom = room_duplicate(room); //duplicate current room

global.currentLevel++;

//if the current level is less than the total number of levels for this stage
if(global.currentLevel < array_length(global.levelArray)){
	//the next level of the stage gets assigned
	newString = global.levelArray[global.currentLevel]; //creates new level string 
	nextLevel = true;
}else{
	
	//if the current level is bigger than the levelArraySize (all the levels of this stage have been completed)
	//see if there is another stage
	if(global.currentStage < array_length(global.stages) - 1){

		//go to the next stage, reset the current level, and load that stage into the level array
		global.currentStage++;
		global.currentLevel = 0;
		global.levelArray = load_stage_se(global.stages[global.currentStage]);
		newString = global.levelArray[global.currentLevel]; //first level of new stage
		nextLevel = true;
		
		var kk = 0

	}else{ //if there are no more stages to progress to
		text = "VICTORY";
		instance_deactivate_all(true); //deactive all the objects
		subtext = "YOU HAVE COMPLETED ALL THE LEVELS. PRESS ESCAPE TO RETURN TO THE MAIN MENU.";
		nextLevel = false;
		
		
	}
	
}

save_player_data();

cam = obj_camera;
cx = cam.x;
cy = cam.y - 20;
cw = camera_get_view_width(cam)
ch = camera_get_view_height(cam)

//if new level file exists, allow progression to next level
//if(file_exists("CGs\\" + newString + ".csv")){
//	text = "VICTORY";
//	subtext = "PRESS SPACE-BAR TO ADVANCE TO THE NEXT LEVEL.";
//	nextLevel = true;
//}else{
//	var stageNum = global.currentStage + 1;
//	var stageCount = array_length(global.stages);
//	if(stageCount <= stageNum){
//			text = "VICTORY";
//			subtext = "YOU HAVE COMPLETED ALL THE LEVELS. PRESS ESCAPE TO RETURN TO THE MAIN MENU.";
//			nextLevel = false;
//			alpha = 0;
//			return;
//			}

//	stageString = global.stages[global.currentStage +1];
//	newString = stageString + string(1);
//	if(file_exists("CGs\\" + newString + ".csv")){
//		global.currentStage++;
//		global.currentLevel = 1;
//		save_player_data();
//		text = "VICTORY";
//		subtext = "PRESS SPACE-BAR TO ADVANCE TO THE NEXT STAGE.";
//		nextLevel = true;
//	}
//	else{
//		//if not, allow escape to menu
//		text = "VICTORY";
//		subtext = "YOU HAVE COMPLETED ALL THE LEVELS. PRESS ESCAPE TO RETURN TO THE MAIN MENU.";
//		nextLevel = false;
//	}
//}


alpha = 0;
depth = -100;



