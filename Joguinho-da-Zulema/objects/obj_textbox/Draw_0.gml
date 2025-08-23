
accept_key = keyboard_check_pressed(vk_space);

// Parametros da textbox
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 144;

// Setup
if setup == false
	{
		setup = true;
		draw_set_font(global.font_main)
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		
		// Loop entre as páginas
		page_number = array_length(text);
		for (var p = 0; p < page_number; p++)
			{
			// Encontrar a qnt de char em cada página e guardar o número no array text_length
			text_length[p] = string_length(text[p]);
			
			// Pega a posição x para a caixa de texto
				// Sem char (no centro)
				text_x_offset[p] = 44;
			}
		
	}

// Digitando o texto
if draw_char < text_length[page]
	{
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
	}

// Passando pelas páginas
if accept_key
	{
	// Se a digitação do texto acabou
	if draw_char == text_length[page]
		{
		// Próxima página
		if page < page_number -1
			{
				page++;
				draw_char = 0;
			}
		// Destruindo a caixa de texto
		else
			{
				instance_destroy();
			}
		}
	
	// Se não acabou de digitar
	else
		{
		draw_char = text_length[page];
		}
	}

// Desenhando a caixa de texto
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

// Atrás da caixa de texto
draw_sprite_ext(txtb_spr, txtb_img, textbox_x + text_x_offset[page], textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

// Desenhando o texto
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);