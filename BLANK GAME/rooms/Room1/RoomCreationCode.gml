game_set_speed(60, gamespeed_fps);
global.legamespeed=(1/60)*1000000;//16666.666666666666666666666666667

global.characters = full_import(working_directory+"duude/file/")
spawnplayer()

global.lay_x=0
camera_set_view_pos(view_camera[0], 0, 313);