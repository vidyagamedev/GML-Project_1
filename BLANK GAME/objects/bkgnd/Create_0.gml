/// @description Insert description here
// You can write your code in this editor

//var __spr = sprite_add(working_directory+"duude/Background/Layer_00.png", 1, false, false, 0, 0);
//var __layer = layer_create(0, "Backgrounds_0")
//layer_background_create(__layer, __spr);


//for (var i = 1;	i <= 10; i += 1){
//	var _spr = sprite_add(working_directory+"duude/Background/Layer_0" + string(i)+ ".png", 1, false, false, 0, 0);
//	var _layer = layer_create(300+i, "Backgrounds_"+string(i))
//	layer_background_create(_layer, _spr);
//}




//var layer2 = layer_create(-4, "Background_Layer2");
//var elem2 = layer_background_create(layer2, spr2);
//layer_background_htiled(elem2, true);
//layer_background_vtiled(elem2, false);

background_map = ds_map_create();
background_map[? layer_get_id("Backgrounds_0")] = -0.5
for (var i = 1;	i <= 10; i += 1){
	background_map[? layer_get_id("Backgrounds_"+string(i))] = 0.1*i
}

//global.lay_x=0