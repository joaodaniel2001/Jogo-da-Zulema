if(button_i >= buttons.length() || button_i <= 0){
	button_i = 0;
	
}else{
	if((keyboard_check_pressed(vk_up)) || (keyboard_check_pressed(ord("W")))){
		button_i += 1;
	}
	if((keyboard_check_pressed(vk_down)) || (keyboard_check_pressed(ord("S")))){
		button_i -= 1;
	}
}

// essa é a lógica básica