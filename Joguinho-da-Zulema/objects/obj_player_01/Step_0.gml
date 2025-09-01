
// Pegando os INPUTS
getControls();

// Movimentação X

	// Direção
	moveDir = right_key - left_key;

	// Pegando a xspd
	xspd = moveDir * moveSpd;

	// Colisão X
	var _subPixel = .5;
	if place_meeting(x + xspd, y, obj_parede)
		{
			// Precissão
			var _pixelCheck = _subPixel * sign(xspd);
			while !place_meeting(x + _pixelCheck, y, obj_parede)
				{
					x += _pixelCheck;
				}
			
			// Colocando o xspd para zero ao colidir
			xspd = 0;
		}

	// Movimentação
	x += xspd;

// Movimentação Y

	// Gravidade
	yspd += grav;
	
	// Resetando as variaveis de pulo
	if onGround
		{
			jump_count = 0;
			jump_hold_timer = 0;
		} else {
			// Se o player está no ar, tirar o pulo extra
			if jump_count == 0 {jump_count = 1;};
		}
		
	// Iniciando o pulo
	if jump_key_buffered && jump_count < jump_max
		{
			// Resetando o Buffer
			jump_key_buffered = false;
			jump_key_buffered_timer = 0;
			
			// Aumentando o número de pulos
			jump_count ++;
			
			// Colocando o hold timer do pulo
			jump_hold_timer = jump_hold_frames[jump_count - 1];
		}
	
	// Tirando o pulo
	if !jump_key
		{
			jump_hold_timer = 0;
		}
	
	// Pulo baseado no timer/holding do botão
	if jump_hold_timer > 0
		{
			// Constantemente colocando o yspd para ser a velocidade do pulo
			yspd = jspd[jump_count - 1];
			
			// Diminundo o timer
			jump_hold_timer --;
		}
		
	// Colissão Y e Movimento
	
	// Cap falling speed
	if yspd > termVel { yspd = termVel; };
		
	// Colisão
	var _subPixel = .5;
	if place_meeting(x, y + yspd, obj_parede)
		{
			// Precissão
			var _pixelCheck = _subPixel * sign(yspd);
			while !place_meeting(x, y + _pixelCheck, obj_parede)
				{
					y += _pixelCheck;
				};
			
			// Bonk code
			if yspd < 0
				{
				jump_hold_timer = 0;
				}
			
			// Colocar o yspd para zero ao colidir
			yspd = 0;
		}
		
	// Verificando se estou no chão
	if yspd >= 0 && place_meeting(x, y + 1, obj_parede)
		{
			onGround = true;
		} else {
			onGround = false;
		}
	
	y += yspd;
	