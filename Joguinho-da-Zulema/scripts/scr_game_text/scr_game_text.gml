function scr_game_text(_text_id){

switch(_text_id) 
	{
		case "npc 1":
			scr_text("Opa! Sou apenas um cara tranquilo. Tu me entende, correto? Bem. Tu. Me. Entende... Certo?", "homem velho");
				src_text_color(19, 32, c_red, c_red, c_red, c_red);
				scr_text_shake(19, 32);
			scr_text("Oi, tudo bem? Sou o Vinicius, vulgo wini", "vinicius", -1);
				src_text_color(36, 40, c_yellow, c_yellow, c_white, c_white)
				scr_text_float(36, 40)
			scr_text("Tudo, voce gosta do Mister?", "homem velho");
				scr_option("Sim", "npc 1 - sim");
				scr_option("Eca, que nojo", "npc 1 - nao");
			break
			case "npc 1 - sim":
				scr_text("Eu tambem gosto dele!", "homem velho")
				break;
			case "npc 1 - nao":
				scr_text("Como!!!!! Saia agora!!!", "homem velho");
				break;
	
		case "npc 2":
			scr_text("Olá! Sou o NPC 02.");
			scr_text("asdasdsadsadasda");
			scr_text("dasdasfgasd");
		break
		
		case "npc 3":
			scr_text("Olá! Sou o NPC 03.");
			scr_text("asdasdsadsadasda");
			scr_text("dasdasfgasd");
		break
		
		case "npc 4":
			scr_text("Olá! Sou o NPC 04.");
			scr_text("asdasdsadsadasda");
			scr_text("dasdasfgasd");
		break
	}
}