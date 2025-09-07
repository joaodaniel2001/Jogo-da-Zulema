
//Funções personalizadas para o jogador
function setOnGround(_val = true)
{
    if (_val == true)
    {
        onGround = true;
        coyote_hang_timer = coyote_hang_frames;
    }
    else
    {
        onGround = false;
        coyote_hang_timer = 0;
    }
}

// Control setup
controlsSetup();

// Sprites
maskSpr = spr_player_idle;

idleSpr = spr_player_idle;
walkSpr = spr_player_andando;
runSpr = spr_player_correndo;
jumpSpr = spr_player_pulo;

// Movimentação
face = 1;
moveDir = 0;
runType = 0;
moveSpd[0] = 2;
moveSpd[1] = 3.5;
xspd = 0;
yspd = 0;

// Pulo
grav = .275;
termVel = 4;
onGround = true;
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;

	// Valores de pulo para cada pulo
	jump_hold_frames[0] = 18;
	jspd[0] = -4.15;
	jump_hold_frames[1] = jump_hold_frames[0] - (jump_hold_frames[0] * 0.15);
	jspd[1] = jspd[0] - (jspd[0] * 0.15);

	// Tempo do Coyote
		// Tempo de seguro
		coyote_hang_frames = 2;
		coyote_hang_timer = 0;
		// Tempo do buffer do pulo
		coyote_jump_frames = 20;
		coyote_jump_timer = 0;