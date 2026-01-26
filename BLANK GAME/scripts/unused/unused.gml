
if false{
	
	for (var i = 0;		// Start at 0
		i < max_items;	// Stop at the limit
		i += 1)			// Move by 1
	{
		// Your code here
	}	
	
	
if global.chkk1=true{chck1=true}else chck1=false//if player character is jumping or not

if instance_exists(a_Player)&&spawn.enemycheck>=0{
	if !atak{//if NOT in atack behaviour... then {if enemy detected nearby then...}
		if ( collision_rectangle(x + -200, y + -200, x + 500, y + 200, NPCe, true, 1) ) !=noone
		{direction = point_direction(x, y, NPCe.x, NPCe.y);}
		else if !chck1
		{//if there are no nearby enemies AND player character is NOT! jumping, then... if NOT too close to player, then move to player... else, don't move
			if collision_rectangle(x-5 +myd*15-10, y + -200, x-5+myd*15-2, y + 200, a_Player, true, 1) =noone
			{direction = point_direction(x, y, a_Player.x+5-myd*15, a_Player.y)}
			else direction=90
		}
	}
	else {//else.... if atak. walk back to player
		direction = point_direction(x, y, a_Player.x, a_Player.y)
		if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, a_Player, true, 1) ) !=noone
		{atak=false}
	}
}

if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, NPCe, true, 1) ) !=noone {//IF ENEMY DETECTED IN RECTANGLE, THEN ATTACK. 
	_space = true
	atak=true;
	direction = point_direction(x, y, NPCe.x, NPCe.y);
}
else {_space = false}

if cos(degtorad(direction)) >0.1{
	_right=true;
	_move_x=1;
	_left=false;
}
else if cos(degtorad(direction)) <-0.1{
	_left=true;
	_move_x=-1
	_right=false;
}
else{_left=false;
	_right=false;}

// Inherit the parent event
event_inherited();
}

if false {

/// @description Insert description here
var _max_devices = 4;

for (var i = 0; i < _max_devices; i++)
{
        var _touch_x = device_mouse_x_to_gui(i);
        var _touch_y = device_mouse_y_to_gui(i);
        
        var _ui_at_pos = instance_position(_touch_x, _touch_y, obj_ui_parent0);
        var _held = device_mouse_check_button(i, mb_left);
        
        if (_ui_at_pos != noone && _held)
        {
                _ui_at_pos.input(i, _touch_x, _touch_y);
        }
}
	
}