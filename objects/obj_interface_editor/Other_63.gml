/// @description Insert description here
// You can write your code in this editor

var i_d = ds_map_find_value(async_load, "id");
if i_d == input {
    // if the user has clicked the 'Okay' button in dialog box
    if (ds_map_find_value(async_load, "status") == true) {
            // if the user has clicked 'Okay'

        var mapName = ds_map_find_value(async_load, "result");
		
                // might be good to adjust this so that the user can't put '/' in the team name

        if (mapName == "") {

            input = get_string_async("You didn't enter anything! Gimme something: ", "")

        }else if(string_count("\\",mapName)){
			input = get_string_async("You cannot include the character // in your filename", "");

		}		
		else if (file_exists("CGs\\" + mapName + ".csv")) {

            input = get_string_async("A map with that name already exists. Try a different one: ", auto_gen_mapname(, "level"));

        } else {
                // directory_create("maps/" + mapName); 
			
			save_CG_set(mapName);

            // reset everything
            show_message(mapName + " saved!");
            state = "move";
			selectedObj = noone;
            obj_sub_toolbar_write.selectedObjTool = noone // update current map name
        }
    }
}