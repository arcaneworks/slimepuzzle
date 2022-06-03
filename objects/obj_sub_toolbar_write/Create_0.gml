x = obj_level_editor.mapOrgX - node_size * 1.5;
y = obj_level_editor.mapOrgY + 2;

width = node_size * (map_width + 3);
height = node_size * 1.7;

tabSize = 5;

//when a new component (actors or elements) gets added a few different things need to be updated. 
//1. create instance of bare component within the object and assign instance variables, add to ds_list (see below);
//2. add component to the component database script (set_component_db)
//3. update decoding scripts (init_CG_decoding_key_new && get_component_info)

//the same applies to new terrain
#region ACTOR CREATION AND LIST
writeTabs = ["actors", "elements", "terrains"];
tabIndex = 0;
actorList = ds_list_create();

knight = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
set_component_info(global.componentDB.knight, knight);
knight.tabType = "actors";
ds_list_add(actorList, knight);

archer = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
set_component_info(global.componentDB.archer, archer);
archer.tabType = "actors";
ds_list_add(actorList, archer);

wizard = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
set_component_info(global.componentDB.wizard, wizard);
wizard.tabType = "actors";
ds_list_add(actorList, wizard);

rogue = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
set_component_info(global.componentDB.rogue, rogue);
rogue.tabType = "actors";
ds_list_add(actorList, rogue);

cleric = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
set_component_info(global.componentDB.cleric, cleric);
cleric.tabType = "actors";
ds_list_add(actorList, cleric);

slime = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
set_component_info(global.componentDB.slime, slime);
slime.tabType = "actors";
ds_list_add(actorList, slime);

shooter = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
set_component_info(global.componentDB.shooter,shooter);
shooter.tabType = "actors";
ds_list_add(actorList, shooter);

shooter2 = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
shooter2.tabType = "actors";
set_component_info(global.componentDB.shooter2, shooter2);
ds_list_add(actorList, shooter2);

fighter = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
fighter.tabType = "actors";
set_component_info(global.componentDB.fighter, fighter);
ds_list_add(actorList, fighter);

brawler = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
brawler.tabType = "actors";
set_component_info(global.componentDB.brawler, brawler);
ds_list_add(actorList, brawler);


thumper = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
thumper.tabType = "actors";
set_component_info(global.componentDB.thumper, thumper);
ds_list_add(actorList, thumper);

eye = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
eye.tabType = "actors";

set_component_info(global.componentDB.eye, eye);
ds_list_add(actorList, eye);

bomb = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
bomb.tabType = "actors";
set_component_info(global.componentDB.bomb, bomb);
ds_list_add(actorList, bomb);



totalActorPages = ceil(ds_list_size(actorList)/5);


#endregion
#region ELEMENT CREATION AND LIST

	elementList = ds_list_create();
	
	rock = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	set_component_info(global.componentDB.rock, rock);
	rock.tabType = "elements";
	ds_list_add(elementList, rock);
	
	barrel = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	barrel.tabType = "elements";
	set_component_info(global.componentDB.barrel,barrel);
	ds_list_add(elementList, barrel);
	
	crate = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	crate.tabType = "elements";
	set_component_info(global.componentDB.crate, crate);
	ds_list_add(elementList, crate);
	
	director = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	set_component_info(global.componentDB.director, director);
	director.tabType = "elements";
	ds_list_add(elementList, director);
	
	wall = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	wall.tabType = "elements";
	set_component_info(global.componentDB.wall, wall);
	ds_list_add(elementList, wall); 
	
	
	totalElementPages = ceil(ds_list_size(elementList)/5);
	
#endregion
#region TERRAIN CREATOION AND LIST
	
	terrainList = ds_list_create();

	hole = instance_create_layer(x, y, "Instances", obj_bare_terrain_tool);
	hole.tabType = "terrains";
	hole.terrainString = "HOLE";
	hole.terrainCode = "TH";
	hole.sprite_index = spr_hole;
	hole.tool = true;
	ds_list_add(terrainList, hole);
	
	fire = instance_create_layer(x, y, "Instances", obj_bare_terrain_tool);
	fire.tabType = "terrains";
	fire.terrainString = "FIRE";
	fire.terrainCode = "TF";
	fire.sprite_index = spr_fire_loop4;
	fire.tool = true;
	ds_list_add(terrainList, fire);
	
	web = instance_create_layer(x, y, "Instances", obj_bare_terrain_tool);
	web.tabType = "terrains";
	web.terrainString = "WEB";
	web.terrainCode = "TW";
	web.sprite_index = spr_web;
	web.tool = true;
	ds_list_add(terrainList, web);
	
	bonfire = instance_create_layer(x, y, "Instances", obj_bare_terrain_tool);
	bonfire.tabType = "terrains";
	bonfire.terrainString = "BONFIRE";
	bonfire.terrainCode = "TB";
	bonfire.sprite_index = spr_bonfire_lit;
	bonfire.tool = true;
	ds_list_add(terrainList, bonfire);
	
	bonfireOff = instance_create_layer(x, y, "Instances", obj_bare_terrain_tool);
	bonfireOff.tabType = "terrains";
	bonfireOff.terrainString = "BONFIRE OFF";
	bonfireOff.terrainCode = "TO";
	bonfireOff.sprite_index = spr_bonfire_off;
	bonfireOff.tool = true;
	ds_list_add(terrainList, bonfireOff);
	
	
	
	
	totalTerrainPages = ceil(ds_list_size(terrainList)/5);

#endregion
#region TAB CREATION

textBuffer = 5; 
tabHeight = sprite_get_height(spr_actors_tab);
tabWidth = sprite_get_width(spr_actors_tab);

actorsTab = instance_create_layer(x + textBuffer, y + textBuffer, "Instances", obj_tab);
actorsTab.tabType = "actors";
actorsTab.sprite_index = spr_actors_tab;

terrainsTab = instance_create_layer(x + textBuffer, y + textBuffer + tabHeight, "Instances", obj_tab);
terrainsTab.tabType = "terrains";
terrainsTab.sprite_index = spr_terrain_tab;

elementsTab = instance_create_layer(x + textBuffer, y + textBuffer + tabHeight * 2, "Instances", obj_tab);
elementsTab.tabType = "elements";
elementsTab.sprite_index = spr_elements_tab;

#endregion
#region POSITON SUBTOOLS


toolStartX = x + tabWidth
buffer = 10;
widthMinusTab = width - tabWidth; 

ds_list_position_within(actorList, toolStartX, y, buffer, widthMinusTab, height, "actors");
//ds_list_position_within(actorList2, toolStartX, y, buffer, widthMinusTab, height,"actors");
//ds_list_position_within(actorList3, toolStartX, y, buffer, widthMinusTab, height,"actors");
ds_list_position_within(elementList, toolStartX, y, buffer, widthMinusTab, height,"elements");
//ds_list_position_within(elementList2, toolStartX, y, buffer, widthMinusTab, height,"elements");
ds_list_position_within(terrainList, toolStartX, y, buffer, widthMinusTab, height,"terrains");

#endregion

#region PAGES

leftArrow = instance_create_layer(x + tabWidth + textBuffer + 2, y + 3, "Instances", obj_arrow_button_left);
rightArrow = instance_create_layer(x + width - 22, y + 3, "Instances", obj_arrow_button_right);

currPage = 0; 

totalPages = 1; 

pageText = string((currPage + 1)) + " / " + string(totalPages);
pageTextWidth = string_width(pageText);


#endregion 

selectedTab = actorsTab;
textStartX = x +  tabWidth +  .5 * widthMinusTab - .5 * pageTextWidth;
textStartY = y + 6; 

nextTab = noone;
selectedObjTool = noone;

