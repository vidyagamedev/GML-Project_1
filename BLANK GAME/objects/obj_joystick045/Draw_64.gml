/// @description Insert description here
// You can write your code in this editor
//draw_self();

//draw_sprite(spr_joystick_stick0, 0, x + joy_x, y + joy_y);
draw_self();  // Giant base sprite

// 2. Draw the circular radius boundary (semi-transparent red circle)
draw_set_alpha(0.4);
draw_set_color(c_red);
draw_circle(x, y, radius, true);           // outline only
draw_circle(x, y, radius, false);          // filled (with alpha for visibility)
draw_set_alpha(1.0);
draw_set_color(c_white);                   // reset for safety