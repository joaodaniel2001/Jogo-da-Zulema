// --- Step Event da plataforma ---

// Inicializar velocidade da plataforma
velv = direcao * velocidade;

// Inverter direção ao colidir com outra plataforma ou limites
if (instance_place(x, y + velv, obj_colisao))
{
    direcao *= -1;
}

// --- Mover player se estiver em cima ---
var player = instance_place(x, y - 1, obj_player_01);
if (player != noone)
{
    // Checa se o player não colide com outra plataforma ao ser movido
    if (!place_meeting(player.x, player.y + velv, obj_colisao))
    {
        player.y += velv; // move o player junto com a plataforma
    }
}

// --- Mover a própria plataforma ---
y += velv;
