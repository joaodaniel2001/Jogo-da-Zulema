depth = -9999;

// Parametros da Caixa de texto
textbox_width = 200;
textbox_height = 64;
border = 8;
line_sep = 12;
line_width = textbox_width - border * 2;
txtb_spr = spr_textbox;
txtb_img = 0;
txtb_img_spd = 6/60;

// Texto
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

setup = false;