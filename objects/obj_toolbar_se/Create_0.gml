

x = obj_saveas_se.x + obj_saveas_se.width * 1.5;
y = 0;

width = 100;
height = 32;

toolList = ds_list_create();

write = instance_create_layer(x, y, "Instances", obj_tool); 
write.toolType = "write";
write.sprite_index = spr_write; 
ds_list_add(toolList, write);

deleteTool = instance_create_layer(x, y, "Instances", obj_tool);
deleteTool.toolType = "delete";
deleteTool.sprite_index = spr_delete;
ds_list_add(toolList, deleteTool); 

move = instance_create_layer(x, y, "Instances", obj_tool);
move.toolType = "move";
move.sprite_index = spr_move;
ds_list_add(toolList, move); 


toolListSize = ds_list_size(toolList);
spriteSize = sprite_get_width(spr_saveas);
toolBuffer = 5;


toolHeight = spriteSize;
toolStartX = x + .5 * width - .5 * ((toolBuffer + spriteSize));

toolY = y + .5 * height - .5 * toolHeight;

for(var ii = 0; ii < ds_list_size(toolList); ii++){
	var tool = ds_list_find_value(toolList, ii);
	
	tool.x = toolStartX + (ii - 1) * (toolBuffer + spriteSize); 
	tool.y = toolY;
	
	
}





