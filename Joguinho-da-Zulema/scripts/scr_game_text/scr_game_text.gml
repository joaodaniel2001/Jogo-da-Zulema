function scr_game_text(_text_id){

switch(_text_id) 
	{
		case "npc 1":
			scr_text("Ola, eu sou Luisa Zick! Seja bem-vindo a nossa regiao.", "zick", -1);
		    src_text_color(12, 21, c_yellow, c_yellow, c_white, c_white);
		    scr_text_float(12, 21);
    
		    scr_text("Esta cidade tem uma historia muito especial e queremos que voce nos ajude a descobri-la.", "zick", -1);
    
		    scr_text("Para isso, voce precisara coletar materiais como madeira, argila e outros recursos espalhados pelo caminho.", "zick", -1);
    
		    scr_text("A cada recurso que voce coletar, vamos poder contar mais sobre a origem de Nereu Ramos e sua comunidade.", "zick", -1);
    
		    scr_text("Fique atento aos desafios da floresta e aos pequenos enigmas. Boa sorte!", "zick", -1);
    
		    break;
			
			
		case "npc 2":
		if (global.madeira >= 6)
			{
			scr_text("Parabens! Voce conseguiu juntar toda a madeira.", "vinicius", -1);
			scr_text("Obrigado, demorei ate conseguir pegar tudo.", "player");
			scr_text("Meu nome e Vinicius e vou te falar um pouco sobre tudo aqui.", "vinicius feliz", -1);
			scr_text("Sabe, antes de Nereu Ramos ter este nome, esta regiao era conhecida como Retorcida...", "vinicius feliz", -1);
				src_text_color(73, 97, c_yellow, c_yellow, c_white, c_white);
				scr_text_float(73, 97)
			scr_text("Uma alusao para as muitas curvas do Rio Itapocu naquela região.", "vinicius", -1)
			scr_text("Os primeiros moradores chegaram aqui para trabalhar com pesca e agricultura, e pouco a pouco foi crescendo ate se tornar a nossa cidade.", "vinicius", -1);
			scr_text("Bem, isso e tudo que eu tinha para falar, siga em frente para saber mais sobre a historia.", "vinicius", -1);
			
			break;
						
			} else {
				scr_text("Voce nao pegou toda a madeira ainda, nao vou te contar a historia!", "vinicius", -1)
				scr_text("Tudo bem, volto depois...", "player")
				
			break;
			}
			
		
		case "npc 3":
		if (global.pedra >= 5)
			{
		    scr_text("Ola, eu sou denovo, Luiza Zick!", "zick", -1);
		    src_text_color(20, 30, c_yellow, c_yellow, c_white, c_white);
		    scr_text_float(20, 30);
    
		    scr_text("Ha mais de 150 anos, italianos vieram para Santa Catarina em busca de melhores condicoes de vida.", "zick", -1);
		    scr_text("A maioria veio das regioes de Trento, Lombardia e Veneto.", "zick", -1);
		    scr_text("Eles se fixaram inicialmente em Rio dos Cedros, Rodeio e Nova Trento.", "zick", -1);
   
		    break;
			} else {
				scr_text("Volte quando tiver com todas as 5 pedras!", "zick", -1);
				break;
			}
		
		case "npc 4":
		if (global.gold >= 3)
			{
			    scr_text("Eu sou Vinicius denovo, e acompanhei o inicio da paróquia.", "vinicius", -1);
			    src_text_color(7, 15, c_yellow, c_yellow, c_white, c_white);
			    scr_text_float(7, 15);
    
			    scr_text("Padre Antônio Echelmeyer abencoeu a primeira pedra em 1947 e liderou a organizacao da paróquia.", "vinicius", -1);
			    scr_text("Ele incentivou a participacao de todas as familias, ajudando a comunidade a se unir em torno da construcao da igreja.", "vinicius", -1);
			    scr_text("A paróquia Nossa Senhora do Rosário foi oficialmente fundada em 15 de agosto de 1952, simbolizando a fe e a uniao dos moradores.", "vinicius", -1);
			    scr_text("Todo o processo contou com muito trabalho coletivo e dedicacao de todos.", "vinicius", -1);
			    scr_text("Obrigado por jogar! Por enquanto é isso!!!", "player");

			    break;

   
			} else {
				scr_text("Volte quando tiver com todos os 3 ouros!", "vinicius", -1);
				break;
			}
		
		

	}
}