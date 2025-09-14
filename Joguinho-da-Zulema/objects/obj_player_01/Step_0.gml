
// Pegando os INPUTS
getControls();

// Movimentação X

	// Direção
	moveDir = right_key - left_key;
	
	// Pegando a face
	if moveDir != 0 {face = moveDir;};

	// Pegando a xspd
	runType = run_key;
	xspd = moveDir * moveSpd[runType];

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

	//Gravity
	if coyote_hang_timer > 0
	{
	    //Count the timer down
	    coyote_hang_timer--;
	}
	else
	{
	    //Apply gravity to the player
	    yspd += grav;
	    //We're no longer on the ground
	    setOnGround(false);
		coyote_jump_timer = 0;
	}

	
	// Resetando as variaveis de pulo
	if onGround
		{
			jump_count = 0;
			coyote_jump_timer = coyote_jump_frames;
		} else {
			// Se o player está no ar, tirar o pulo extra
			coyote_jump_timer--;
			if jump_count == 0 && coyote_jump_timer <= 0 {jump_count = 1;};
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
			
			setOnGround(false);
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
			
			
			// Colocar o yspd para zero ao colidir
			yspd = 0;
		}
		
	// Verificando se estou no chão
	if yspd >= 0 && place_meeting(x, y + 1, obj_parede)
		{
			setOnGround(true);
		}
	
	y += yspd;
	
	
// Controle de Sprites
	// Andando
	if abs (xspd) > 0 {sprite_index = walkSpr};
	// Correndo
	if abs (xspd) >= moveSpd[1] {sprite_index = runSpr};
	// Não andando
	if xspd == 0 {sprite_index = idleSpr;};
	// No ar
	if !onGround {sprite_index = jumpSpr};
	
		// Colocando a colisão
		mask_index = maskSpr;

// Iniciando ataque ao apertar J
if (keyboard_check_pressed(ord("J")) && !isAttacking)
{
    isAttacking = true;
    attack_timer = attack_duration;
}

// Atualizando sprite de ataque
if (isAttacking)
{
    sprite_index = attackSpr;
    mask_index = maskSpr; // mantém a mesma colisão

    attack_timer--;
    if (attack_timer <= 0)
    {
        isAttacking = false;
    }
}
