/// @description Insert description here
// Capture NEW press inside radius (checks all touches once)
if (touch_id == -1) {
    for (var i = 0; i < 4; i++) {
        if (device_mouse_check_button(i, mb_left)) {
            var tx = device_mouse_x_to_gui(i);
            var ty = device_mouse_y_to_gui(i);
			if (point_distance(x, y, tx, ty) <= radius) {
                touch_id = i;
                break;  // Grab first valid touch
            }
        }
    }
}

// Track/release THIS touch_id
if (touch_id != -1) {
    if (!device_mouse_check_button(touch_id, mb_left)) {
        // Released
        touch_id     = -1;
        joy_x        = 0;
        joy_y        = 0;
        global.RSPress = false;
    } else {
        // Held: update offset & check radius
        var tx = device_mouse_x_to_gui(touch_id);
        var ty = device_mouse_y_to_gui(touch_id);
        joy_x = tx - x;
        joy_y = ty - y;

		var dist = point_distance(0, 0, joy_x, joy_y);
        global.RSPress = (dist <= radius);
    }
} else {
    // Idle safety reset
    global.RSPress = false;
}