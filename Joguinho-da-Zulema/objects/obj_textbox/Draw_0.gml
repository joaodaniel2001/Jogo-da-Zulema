accept_key = keyboard_check_pressed(ord("E"))

// Parametros da textbox
textbox_x = camera_get_view_x(view_camera[0])
textbox_y = camera_get_view_y(view_camera[0]) + 144

// Setup inicial
if setup == false
{
    setup = true
    draw_set_font(global.font_main)
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)

    page_number = array_length(text)
    for (var p = 0; p < page_number; p++)
    {
        text_length[p] = string_length(text[p])
        text_x_offset[p] = 80
        portrait_x_offset[p] = 8

        if speaker_side[p] == -1
        {
            text_x_offset[p] = 8
            portrait_x_offset[p] = 319
        }

        if speaker_sprite[p] == noone
        {
            text_x_offset[p] = 44
        }

        for (var c = 0; c < text_length[p]; c++)
        {
            var _char_pos = c + 1
            char[c, p] = string_char_at(text[p], _char_pos)

            var _txt_up_to_char = string_copy(text[p], 1, _char_pos)
            var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p])

            if char[c, p] == " " { last_free_space = _char_pos + 1 }

            if _current_txt_w - line_break_offset[p] > line_width
            {
                line_break_pos[line_break_num[p], p] = last_free_space
                line_break_num[p]++
                var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space - 1)
                var _last_free_space_string = string_char_at(text[p], last_free_space)
                line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string)
            }
        }
    }
}

// recalcular char_x e char_y sempre (acompanha a câmera)
for (var c = 0; c < text_length[page]; c++)
{
    var _char_pos = c + 1
	var _txt_x = textbox_x + text_x_offset[page] + border
	if speaker_side[page] != -1 { _txt_x += 30 }

	// Calcula primeiro a largura do texto
	var _txt_up_to_char = string_copy(text[page], 1, _char_pos)
	var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, page])

	var _txt_y = textbox_y + border
	var _txt_line = 0

	// Compensa quebras de linha
	for (var lb = 0; lb < line_break_num[page]; lb++)
	{
	    if _char_pos >= line_break_pos[lb, page]
	    {
	        var _str_copy = string_copy(text[page], line_break_pos[lb, page], _char_pos - line_break_pos[lb, page])
	        _current_txt_w = string_width(_str_copy)
	        _txt_line = lb + 1
	    }
	}

	// Agora sim podemos definir char_x e char_y
	char_x[c, page] = _txt_x + _current_txt_w
	char_y[c, page] = _txt_y + _txt_line * line_sep

}

// Digitando o texto
if text_pause_timer <= 0
{
    if draw_char < text_length[page]
    {
        draw_char += text_spd
        draw_char = clamp(draw_char, 0, text_length[page])
        var _check_char = string_char_at(text[page], draw_char)
        if _check_char == "." || _check_char == "?" || _check_char == "!" || _check_char == ","
        {
            text_pause_timer = text_pause_time
            if !audio_is_playing(snd[page]) {audio_play_sound(snd[page], 16, false)}
        }
        else
        {
            if snd_count < snd_count
            {
                snd_count++
            }
            else
            {
                snd_count = 0
                audio_play_sound(snd[page], 0, false)
            }
        }
    } 
}
else
{
    text_pause_timer--
}

// Passando pelas páginas
if accept_key
{
    if draw_char == text_length[page]
    {
        if page < page_number - 1
        {
            page++
            draw_char = 0
        }
        else
        {
            if option_number > 0
            {
                create_textbox(option_link_id[option_pos])
            }
            instance_destroy()
        }
    }
    else
    {
        draw_char = text_length[page]
    }
}

// Desenhando a caixa de texto
var _txtb_x = textbox_x + text_x_offset[page]

if speaker_side[page] != -1 {  // se o falante está à esquerda
    _txtb_x += 30;              // move 50 pixels para a direita
}

var _txtb_y = textbox_y
txtb_img += txtb_img_spd
txtb_spr_w = sprite_get_width(txtb_spr[page])
txtb_spr_h = sprite_get_height(txtb_spr[page])

// Desenhando quem fala
if speaker_sprite[page] != noone
{
    sprite_index = speaker_sprite[page]
    if draw_char == text_length[page] {image_index = 0}
    
    var _speaker_x = textbox_x + portrait_x_offset[page]
    if speaker_side[page] == -1
    {
        _speaker_x += sprite_width
    }
    
    draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, 1)
    draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1)
}

// Atrás da caixa de texto
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1)

// Opções
if draw_char == text_length[page] && page == page_number - 1
{
    option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
    option_pos = clamp(option_pos, 0, option_number - 1)
    
    var _op_space = 15
    var _op_bord = 4
    
    for (var op = 0; op < option_number; op++)
    {
        var _o_w = string_width(option[op]) + _op_bord * 2
        draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 16, _txtb_y - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h, 0, c_white, 1)
        
        if option_pos == op
        {
            draw_sprite(spr_textbox_arrow, 0, _txtb_x, _txtb_y - _op_space * option_number + _op_space * op)
        }
        
        draw_text(_txtb_x + 16 + _op_bord, _txtb_y - _op_space * option_number + _op_space * op + 2, option[op])
    }
}

// Desenhando o texto
for (var c = 0; c < draw_char; c++)
{
    var _float_y = 0
    if float_text[c, page] == true
    {
        float_dir[c, page] += -6
        _float_y = dsin(float_dir[c, page])
    }
    
    var _shake_x = 0
    var _shake_y = 0
    if shake_text[c, page] == true
    {
        shake_timer[c, page]--
        if shake_timer[c, page] <= 0
        {
            shake_timer[c, page] = irandom_range(4, 8)
            shake_dir[c, page] = irandom(360)
        }
        if shake_timer[c, page] <= 2
        {
            _shake_x = lengthdir_x(1, shake_dir[c, page]);
            _shake_y = lengthdir_y(1, shake_dir[c, page]);
        }
    }
    
    draw_text_color(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1)
}
