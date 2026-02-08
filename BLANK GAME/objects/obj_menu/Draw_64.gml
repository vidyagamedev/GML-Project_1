/// @description Insert description here
// You can write your code in this editor
var _menu=truth(menu)
switch _menu{
	case -1: case 1: case 4: case 5: case 6: break
	default:{
		draw_sprite_ext(spr_button, -1, 320, 126, 0.4, 0.4, 0, c_white, .8)
		draw_sprite_ext(spr_button, -1, 320, 186, 0.4, 0.4, 0, c_white, .8);
		draw_sprite_ext(spr_button, -1, 320, 246, 0.4, 0.4, 0, c_white, .8);
	}
}
auto_array_loop(menu_text_array,auto_text)

if selected_action>=0{
	//draw_sprite(global.characters[selected_char][selected_action+1][0],image_index,300,277)
	
}
