ds_list_clear(drawList);

for(var ii = 0; ii < ds_list_size(levelList); ii++){
	var levelBox = ds_list_find_value(levelList, ii);
	ds_list_add(drawList, levelBox.level);
}

if(pause_pressed()){
		instance_deactivate_all(true)
		TransitionStart(rm_title_screen, sqFadeOut, sqFadeInMenu);	
}
