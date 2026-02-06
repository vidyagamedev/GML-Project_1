/// @description Insert description here
// You can write your code in this editor
var _menu=truth(menu)
if _menu>=0&&_menu!=1{
	draw_sprite_ext(spr_button, -1, 320, 126, 0.4, 0.4, 0, c_white, .8)
	draw_sprite_ext(spr_button, -1, 320, 186, 0.4, 0.4, 0, c_white, .8);
	draw_sprite_ext(spr_button, -1, 320, 246, 0.4, 0.4, 0, c_white, .8);
}

auto_array_loop(menu_text_array,auto_text)
