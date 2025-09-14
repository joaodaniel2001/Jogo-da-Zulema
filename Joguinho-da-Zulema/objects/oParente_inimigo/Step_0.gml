
if hit == true{
	veloc = 0;
	alarm[1] = 5;
	hit = false;
}

if vida <= 0{
	if reset == false{
		image_index = 0;
		reset = true;
	}
	sprite_index = sprite_morrendo;
	
	if scr_fim_da_animacao(){
		instance_destroy();
	}
}