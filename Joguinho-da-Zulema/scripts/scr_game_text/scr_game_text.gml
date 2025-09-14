function scr_game_text(_text_id){

switch(_text_id) 
	{
		case "npc 1":
			scr_text("Ola, eu sou Luisa Zick! Voce veio na hora certa.", "zick", -1);
				src_text_color(12, 21, c_yellow, c_yellow, c_white, c_white);
				scr_text_float(12, 21)
			scr_text("O que aconteceu?", "player");
			scr_text("Voce precisa tomar cuidado por aqui… a floresta esta cheia de perigos!", "zick", -1);
				src_text_color(19, 26, c_red, c_red, c_red, c_red)
				scr_text_shake(19, 26)
			scr_text("Perigos? Que tipo de perigos?", "player");
			scr_text("Criaturas estranhas e armadilhas naturais. Mas se voce quiser ajudar…", "zick", -1);
			scr_text("…precisara coletar materiais para construir a igreja.", "zick", -1);
			scr_text("Materiais? Como assim?", "player");
			scr_text("Madeira, pedra e alguns cristais especiais que voce pode encontrar pelo caminho.", "zick", -1);
			scr_text("Entendi. E depois que eu trouxer tudo?", "player");
			scr_text("Entao poderemos trabalhar juntos e terminar a igreja. Mas fique atento!", "zick", -1);
			
			break;
			
		case "npc 2":
			scr_text("Oi amigo, sou o Vinicius!", "vinicius", -1);
				src_text_color(16, 23, c_yellow, c_yellow, c_white, c_white);
				scr_text_float(16, 23);
			scr_text("Entao e voce quem venho nos ajudar a construir nossa cidade!", "vinicius feliz", -1);
			scr_text("Sim, estou pronto para ajudar", "player");
			scr_text("A Luisa já deve ter te falado o que vai ter que pegar, correto?", "vinicius", -1);
				src_text_color(2, 7, c_yellow, c_yellow, c_white, c_white);
				scr_text_float(2, 7)
			scr_option("Sim, ja falou", "npc 2 - sim");
			scr_option("Acho que nao", "npc 2 - nao");
			
			break;
				
				case "npc 2 - sim":
					scr_text("Otimo! Entao siga em frente e colete os minerios que precisamos.", "vinicius")
					scr_text("Cuidado com os morcegos e pedras rolantes!", "vinicius", -1);
					break;
		
				case "npc 2 - nao":
				    scr_text("Sem problemas! Voce precisa pegar pedras e depois os minerios.", "vinicius", -1);
				    scr_text("Fique atento aos inimigos e cuidado para nao se machucar!", "vinicius", -1);
				    break;

	}
}