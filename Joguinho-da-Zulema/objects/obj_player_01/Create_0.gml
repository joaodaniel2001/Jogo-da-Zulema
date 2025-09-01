
// Control setup
controlsSetup();

// Movimentação
moveDir = 0;
moveSpd = 2;
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
