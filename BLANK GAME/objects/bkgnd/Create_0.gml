/// @description Insert description here
// You can write your code in this editor

background_map = ds_map_create();
background_map[? layer_get_id("Backgrounds_0")] = -0.5
for (var i = 1;		// Start at 0
	i <= 10;	// Stop at the limit
	i += 1)			// Move by 1
{
	background_map[? layer_get_id("Backgrounds_"+string(i))] = 0.1*i
}	


//var str1 = "Hello";
//var str2 = "World";
//var str3 = string(i);
//var result = str1 + " " + str2; // Result: "Hello World"



	
//background_map[? layer_get_id("Backgrounds_11")] = 1
//background_map[? layer_get_id("Backgrounds_10")] = 0.9
//background_map[? layer_get_id("Backgrounds_9")] = 0.8
//background_map[? layer_get_id("Backgrounds_8")] = 0.8
//background_map[? layer_get_id("Backgrounds_7")] = 0.7
//background_map[? layer_get_id("Backgrounds_6")] = 0.6
//background_map[? layer_get_id("Backgrounds_5")] = 0.5
//background_map[? layer_get_id("Backgrounds_4")] = 0.4
//background_map[? layer_get_id("Backgrounds_3")] = 0.3
//background_map[? layer_get_id("Backgrounds_2")] = 0.2
//background_map[? layer_get_id("Backgrounds_1")] = 0.1

//lay_id1 = layer_get_id("Assets_2");
//lay_id3 = layer_get_id("Assets_1");
global.lay_x=0

_cx = camera_get_view_x(view_camera[0]);

xDIFF=0


global.BGMVMT=true
		
global._old_cx=0
global.new_cx=0