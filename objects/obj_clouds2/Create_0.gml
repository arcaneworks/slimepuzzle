cloudId = layer_get_id("Clouds_2");
start = layer_get_x(cloudId)
X = start + room_width;
incSpeed = .45;

goal = X - room_width * 2; 

layer_x(cloudId, start);