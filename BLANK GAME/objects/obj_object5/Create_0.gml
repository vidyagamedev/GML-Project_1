/// @description Insert description here
// You can write your code in this editor
draw_set_font (fnt_button);		#region Set Font
draw_set_valign(fa_middle)		#endregion // Set Text Alignment
global.characters	= full_import(working_directory+"duude/file/")
					spawnplayer()
					global.lay_x=0
					camera_set_view_pos(view_camera[0], 0, 313);
					//enemycheck=0