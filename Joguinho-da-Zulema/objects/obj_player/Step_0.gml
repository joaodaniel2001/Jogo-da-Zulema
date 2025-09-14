var leftMov = keyboard_check(vk_left);
var rightMov = keyboard_check(vk_right);
var upMov = keyboard_check(vk_up);
var downMov = keyboard_check(vk_down);

xspd = (rightMov - leftMov) * spd;
yspd = (downMov - upMov) * spd;

mask_index = sprite[DOWN];
if(yspd == 0){
	if(xspd < 0){ face = RIGHT; }
	if(xspd > 0){ face = LEFT; }
}

if(xspd < 0 && face == LEFT){ face = RIGHT; }
if(xspd > 0 && face == RIGHT){ face = LEFT; }

if(xspd == 0){
	if(yspd > 0){ face = DOWN; }
	if(yspd < 0){ face = UP; }
}

if(yspd > 0 && face == UP){ face = DOWN; }
if(yspd < 0 && face == DOWN){ face = UP; }

if(place_meeting(x + xspd, y, obj_wall) || place_meeting(x + xspd, y, obj_halfwall)){
	xspd = 0;
}
if(place_meeting(x, y + yspd, obj_wall) || place_meeting(x, y + yspd, obj_halfwall)){
	yspd = 0;
}

x += xspd;
y += yspd;

sprite_index = sprite[face];

if(xspd == 0 && yspd == 0){
	image_index = 0;
}

depth = -bbox_bottom;