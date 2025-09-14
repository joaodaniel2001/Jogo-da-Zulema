if(fading){
	alpha += 0.05;
	if(alpha >= 1){
		room_goto(room_target);
	}
}