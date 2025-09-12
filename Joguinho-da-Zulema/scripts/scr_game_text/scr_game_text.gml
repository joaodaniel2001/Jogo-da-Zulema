function scr_game_text(_text_id){

switch(_text_id) 
	{
		case "npc 1":
			scr_text("Olá! Sou o NPC 01.");
				scr_option("Yeah", "npc 1 - sim");
				scr_option("Nah", "npc 1 - nao");
			break
			case "npc 1 - sim":
				scr_text("Sim! Na festa do Carlinhos Maia")
				break;
			case "npc 1 - nao":
				scr_text("No! Passo bem solto passo bem solto");
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