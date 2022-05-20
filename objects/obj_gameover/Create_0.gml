//obj_level.visible = false; //make level UI invisible
oldString = global.gameObj.levelString; //find old level string
instance_deactivate_all(true); //deactive all the objects
instance_activate_object(obj_level); //except for the persistant level object
instance_activate_object(obj_camera);
newRoom = room_duplicate(room); //duplicate current room


global.currentLevel++;
//oldLevelNumber = real(string_char_at(oldString, 6)); //finds current level number
//newLevelNumber = oldLevelNumber + 1; //next level number
var stageString = global.stages[global.currentStage];
newString = stageString + string(global.currentLevel); //creates new level string 
save_player_data();

//obj_level.levelString = newString;	


//sets text x, y, width, height
cam = obj_camera;
cx = cam.x;
cy = cam.y - 20;
cw = camera_get_view_width(cam)
ch = camera_get_view_height(cam)

//if new level file exists, allow progression to next level
if(file_exists("CGs\\" + newString + ".csv")){
	text = "VICTORY";
	subtext = "PRESS SPACE-BAR TO ADVANCE TO THE NEXT LEVEL.";
	nextLevel = true;
}else{

	stageString = global.stages[global.currentStage +1];
	newString = stageString + string(1);
	if(file_exists("CGs\\" + newString + ".csv")){
		global.currentStage++;
		global.currentLevel = 1;
		
	text = "VICTORY";
	subtext = "PRESS SPACE-BAR TO ADVANCE TO THE NEXT LEVEL.";
	nextLevel = true;
	}
	else{
		//if not, allow escape to menu
		text = "VICTORY";
		subtext = "YOU HAVE COMPLETED ALL THE LEVELS. PRESS ESCAPE TO RETURN TO THE MAIN MENU.";
		nextLevel = false;
	}
}


alpha = 0;
depth = -100;



