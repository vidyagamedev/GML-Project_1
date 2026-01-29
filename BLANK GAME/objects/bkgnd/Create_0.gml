/// @description Insert description here
// You can write your code in this editor

background_map = ds_map_create();
background_map[? layer_get_id("Backgrounds_0")] = -0.5
for (var i = 1;	i <= 10; i += 1){
	background_map[? layer_get_id("Backgrounds_"+string(i))] = 0.1*i
}

global.lay_x=0
_cx = camera_get_view_x(view_camera[0]);
