draw_set_alpha(alpha);
draw_set_color(color);

var p = obj_game;


draw_rectangle(0, 0, room_width, p.mapOrgY, false);
draw_rectangle(0, p.mapOrgY, p.mapOrgX, room_height, false);
//draw_rectangle(p.mapOrgX, p.mapOrgY + game_size, room_width - p.mapOrgX, room_height, false);
draw_rectangle(p.mapOrgX + game_width, p.mapOrgY, room_width, room_height, false);

draw_set_alpha(1);
draw_set_color(c_white);