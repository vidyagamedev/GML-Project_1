/// @description Insert description here
if (touch_id == -1) {
	for (var i = 0; i < 4; i++) {
		if (device_mouse_check_button(i, mb_left)) {
			var tx = device_mouse_x_to_gui(i);
			var ty = device_mouse_y_to_gui(i);
			if (point_distance(x, y, tx, ty) <= radius) {
				touch_id = i;
				break; // Grab first valid touch
			}
		}
	}
}

if (touch_id != -1) {
	if (!device_mouse_check_button(touch_id, mb_left)) {
		touch_id = -1;
		joy_x = 0;
		joy_y = 0;
	}
	else {
		var tx = device_mouse_x_to_gui(touch_id);
		var ty = device_mouse_y_to_gui(touch_id);
		joy_x = tx - x;
		joy_y = ty - y;

		var dist = point_distance(0, 0, joy_x, joy_y);
		if (dist > radius) {
			var _direction = point_direction(0, 0, joy_x, joy_y);
			joy_x = lengthdir_x(radius, _direction);
			joy_y = lengthdir_y(radius, _direction);
		}
	}
}
else {
	joy_x = 0;
	joy_y = 0;
}
if visible=true {
global._move_x = joy_x / radius;
global._move_y = joy_y / radius;
}
else if (touch_id != -1) {global.RSPress = (dist <= radius)}else{global.RSPress = false}