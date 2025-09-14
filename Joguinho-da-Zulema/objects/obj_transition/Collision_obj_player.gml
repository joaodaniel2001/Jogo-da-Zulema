if(!instance_exists(obj_fade)){
	var fade = instance_create_layer(0, 0, "GUI", obj_fade);
	fade.fading = true;
	fade.room_target = room_outside;
}