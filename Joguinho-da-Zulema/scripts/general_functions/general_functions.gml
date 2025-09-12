
function controlsSetup ()
	{
		bufferTime = 3;
		
		jump_key_buffered = 0
		jump_key_buffered_timer = 0;
	}

function getControls ()
	{
		// Inputs direcionais
		right_key = (keyboard_check(ord("D"))) + gamepad_button_check(0, gp_padr);
			right_key = clamp (right_key, 0, 1);
		
		left_key = (keyboard_check(ord("A"))) + gamepad_button_check(0, gp_padl);
			left_key = clamp (left_key, 0, 1);
		
		// Inputs de Ações
		jump_key_pressed = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"))) + gamepad_button_check_pressed(0, gp_face1);
			jump_key_pressed = clamp(jump_key_pressed, 0, 1);
			
		jump_key = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"))) + gamepad_button_check(0, gp_face1);
			jump_key = clamp(jump_key, 0, 1);
			
		run_key = keyboard_check(vk_shift) + gamepad_button_check(0, gp_face3);
			run_key = clamp (run_key, 0, 1)
			
		// Jump Key Buffering
		if jump_key_pressed
			{
				jump_key_buffered_timer = bufferTime;
			}
			
		if jump_key_buffered_timer > 0
			{
				jump_key_buffered = 1;
				jump_key_buffered_timer --;
			} else {
				jump_key_buffered = 0;
			}
	}