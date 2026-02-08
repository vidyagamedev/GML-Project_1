/// @description Insert description here
// You can write your code in this editor

if !
	(
		(
		keyboard_check(vk_lshift)
		)
		&&
		(
		keyboard_check(ord("1"))
		)	
	)
	{gpu_set_texfilter(false)};

//gpu_set_texfilter(false);
draw_self();
gpu_set_texfilter(true)

