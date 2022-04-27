camera = camera_create();


camX = x;
camY = y; 
camHeight = 360;
camWidth = 640;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(camWidth,camHeight, 1, 10000);


camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

display_set_gui_maximize();
display_set_gui_size(camWidth, camHeight);

view_camera[0] = camera;


follow = noone;
xTo = x;
yTo = y;

shake = true;

state = "idle"

//global.light_init = layer_create(-300, "Light_Init");
//global.light_sources = layer_create(-299, "Light_Sources");
//instance_create_layer(x, y, global.light_init, obj_light_ctrl);
//instance_create_layer(x, obj_caravan.y - 100, global.light_sources, obj_lantern);