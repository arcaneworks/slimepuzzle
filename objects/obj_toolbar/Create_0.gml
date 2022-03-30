

x = obj_level_editor.mapOrgX + node_size * map_width +5;
y = obj_level_editor.mapOrgY - node_size * map_height;

width = node_size * 1.4;
height = node_size * map_height;

toolList = ds_list_create();

move = instance_create_layer(x, y, "Instances", obj_tool);
move.toolType = "move";
move.sprite_index = spr_move;
ds_list_add(toolList, move);

write = instance_create_layer(x, y, "Instances", obj_tool); 
write.toolType = "write";
write.sprite_index = spr_write; 
ds_list_add(toolList, write);

deleteTool = instance_create_layer(x, y, "Instances", obj_tool);
deleteTool.toolType = "delete";
deleteTool.sprite_index = spr_delete;
ds_list_add(toolList, deleteTool); 

save = instance_create_layer(x, y, "Instances", obj_tool);
save.toolType = "save";
save.sprite_index = spr_save;
ds_list_add(toolList, save);

saveas = instance_create_layer(x, y, "Instances", obj_tool); 
saveas.toolType = "saveas";
saveas.sprite_index = spr_saveas;
ds_list_add(toolList, saveas);

load = instance_create_layer(x, y, "Instances", obj_tool); 
load.toolType = "load";
load.sprite_index = spr_load;
ds_list_add(toolList, load);


toolListSize = ds_list_size(toolList);
spriteSize = sprite_get_width(spr_saveas);
toolBuffer = 5;


toolHeight = toolListSize * (toolBuffer + spriteSize);
toolStartX = x + .5 * width - .5 * spriteSize;

toolY = y + .5 * height - .5 * toolHeight;

for(var ii = 0; ii < ds_list_size(toolList); ii++){
	var tool = ds_list_find_value(toolList, ii);
	
	tool.x = toolStartX; 
	tool.y = toolY + ii * (toolBuffer + spriteSize);
	
	
}





