x = obj_level_editor.mapOrgX - node_size * 1.5;
y = obj_level_editor.mapOrgY + 2;

width = node_size * (map_width + 3);
height = node_size * 1.7;


//when a new component (actors or elements) gets added a few different things need to be updated. 
//1. create instance of bare component within the object and assign instance variables, add to ds_list (see below);
//2. add component to the component database script (set_component_db)
//3. update decoding scripts (init_CG_decoding_key_new && get_component_info)

//the same applies to new terrain
#region ACTOR CREATION AND LIST

actorList = ds_list_create();

knight = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
knight.componentCode = "CK";
knight.tabType = "actors";
knight.sprite_index = spr_knight1; 
knight.tool = true;
ds_list_add(actorList, knight);

archer = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
archer.tabType = "actors";
archer.componentCode = "CA";
archer.sprite_index = spr_archer1; 
archer.tool = true;
ds_list_add(actorList, archer);

wizard = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
wizard.tabType = "actors";
wizard.componentCode = "CW";
wizard.sprite_index = spr_wizard1; 
wizard.tool = true;
ds_list_add(actorList, wizard);

rogue = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
rogue.tabType = "actors";
rogue.componentCode = "CR";
rogue.sprite_index = spr_rogue; 
rogue.tool = true;
ds_list_add(actorList, rogue);

cleric = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
cleric.tabType = "actors";
cleric.componentCode = "CC";
cleric.sprite_index = spr_cleric; 
cleric.tool = true;
ds_list_add(actorList, cleric);

shooter = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
shooter.tabType = "actors";
shooter.componentCode = "CS";
shooter.sprite_index = spr_shooter2; 
shooter.tool = true;
ds_list_add(actorList, shooter);

shooter2 = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
shooter2.tabType = "actors";
shooter2.componentCode = "CP";
shooter2.sprite_index = spr_shooter3; 
shooter2.tool = true;
ds_list_add(actorList, shooter2);

fighter = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
fighter.tabType = "actors";
fighter.componentCode = "CF";
fighter.sprite_index = spr_fighter2; 
fighter.tool = true;
ds_list_add(actorList, fighter);

thumper = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
thumper.tabType = "actors";
thumper.componentCode = "CT";
thumper.sprite_index = spr_thumper; 
thumper.tool = true;
ds_list_add(actorList, thumper);

eye = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
eye.tabType = "actors";
eye.componentCode = "CE";
eye.sprite_index = spr_eye; 
eye.tool = true;
ds_list_add(actorList, eye);

bomb = instance_create_layer(x, y, "Instances", obj_bare_component_tool); 
bomb.tabType = "actors";
bomb.componentCode = "CB";
bomb.sprite_index = spr_bomb1; 
bomb.tool = true;
ds_list_add(actorList, bomb);


sort_actor_pages();

totalActorPages = 3; 


#endregion
#region ELEMENT CREATION AND LIST

	elementList1 = ds_list_create();
	elementList2 = ds_list_create();
	
	rock = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	rock.tabType = "elements";
	rock.componentCode = "ER";
	rock.sprite_index = spr_rock1;
	rock.tool = true;
	ds_list_add(elementList1, rock);
	
	barrel = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	barrel.tabType = "elements";
	barrel.componentCode = "EB";
	barrel.sprite_index = spr_barrel1;
	barrel.tool = true;
	ds_list_add(elementList1, barrel);
	
	crate = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	crate.tabType = "elements";
	crate.componentCode = "EP";
	crate.sprite_index = spr_crate;
	crate.tool = true;
	ds_list_add(elementList1, crate);
	
	directorLD = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	directorLD.tabType = "elements";
	directorLD.componentCode = "EA";
	directorLD.sprite_index = spr_directorLD;
	directorLD.tool = true;
	ds_list_add(elementList2, directorLD);
	
	directorRD = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	directorRD.tabType = "elements";
	directorRD.componentCode = "ES";
	directorRD.sprite_index = spr_directorRD;
	directorRD.tool = true;
	ds_list_add(elementList2, directorRD);
	
	directorUL = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	directorUL.tabType = "elements";
	directorUL.componentCode = "ED";
	directorUL.sprite_index = spr_directorUL;
	directorUL.tool = true;
	ds_list_add(elementList2, directorUL);
	
	directorUR = instance_create_layer(x, y, "Instances", obj_bare_element_tool);
	directorUR.tabType = "elements";
	directorUR.componentCode = "EF";
	directorUR.sprite_index = spr_directorUR;
	directorUR.tool = true;
	ds_list_add(elementList2, directorUR);
	

	totalElementPages = 2; 
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
	
	
	
	
	totalTerrainPages = 1;

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

ds_list_position_within(actorList1, toolStartX, y, buffer, widthMinusTab, height);
ds_list_position_within(actorList2, toolStartX, y, buffer, widthMinusTab, height);
ds_list_position_within(actorList3, toolStartX, y, buffer, widthMinusTab, height);
ds_list_position_within(elementList1, toolStartX, y, buffer, widthMinusTab, height);
ds_list_position_within(elementList2, toolStartX, y, buffer, widthMinusTab, height);
ds_list_position_within(terrainList, toolStartX, y, buffer, widthMinusTab, height);

#endregion

#region PAGES

leftArrow = instance_create_layer(x + tabWidth + textBuffer + 2, y + 3, "Instances", obj_arrow_button_left);
rightArrow = instance_create_layer(x + width - 22, y + 3, "Instances", obj_arrow_button_right);

currPage = 1; 

totalPages = 1; 

pageText = string(currPage) + " / " + string(totalPages);
pageTextWidth = string_width(pageText);


#endregion 

selectedTab = actorsTab;
textStartX = x +  tabWidth +  .5 * widthMinusTab - .5 * pageTextWidth;
textStartY = y + 6; 

nextTab = noone;
selectedObjTool = noone;

