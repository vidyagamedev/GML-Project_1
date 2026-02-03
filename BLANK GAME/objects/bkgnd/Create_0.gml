/// @description Insert description here
// You can write your code in this editor

var _spr = sprite_add(working_directory+"duude/Background/Layer_00.png", 1, false, false, 0, 0);
var _layer = layer_create(-1, "Backgrounds_0")
var _elmnt = layer_background_create(_layer, _spr);
layer_background_htiled(_elmnt, true);

for (var i = 1;	i <= 10; i += 1){
	_spr = sprite_add(working_directory+"duude/Background/Layer_0" + string(i)+ ".png", 1, false, false, 0, 0);
	_layer = layer_create(300+i, "Backgrounds_"+string(i))
	_elmnt = layer_background_create(_layer, _spr);
	layer_background_htiled(_elmnt, true);
}


background_map = ds_map_create();
background_map[? layer_get_id("Backgrounds_0")] = -0.5
for (var i = 1;	i <= 10; i += 1){
	background_map[? layer_get_id("Backgrounds_"+string(i))] = 0.1*i
}

//global.lay_x=0