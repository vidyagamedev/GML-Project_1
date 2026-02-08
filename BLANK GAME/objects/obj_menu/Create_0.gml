/// @description Insert description here
// You can write your code in this editor
menu_functions()	//preparing scripts
draw_set_font (fnt_button)
draw_set_valign(fa_middle)

ecks=x

menu=[];menu[0]=true
menu_script()
global.characters = full_import(working_directory+"duude/file/")
if !(variable_global_exists("selection")) then global.selection[array_length(global.characters)]=false
selected_action=-1
