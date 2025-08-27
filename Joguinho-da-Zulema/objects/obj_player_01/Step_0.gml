// Entrada do teclado
mov_direita = keyboard_check(ord("D")) || keyboard_check(vk_right);
mov_esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left);
mov_cima = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up);


// Movimento horizontal
hveloc = (mov_direita - mov_esquerda) * veloc;

// Aplicar gravidade
if (!place_meeting(x, y + 1, obj_parede)) {
    vveloc += gravidade;
} else {
    // Está no chão
    vveloc = 0;
    
    // Pulo
    if (mov_cima) {
        vveloc = -2.8;
    }
}

// Colisão horizontal
if (place_meeting(x + hveloc, y, obj_parede)) {
    while (!place_meeting(x + sign(hveloc), y, obj_parede)) {
        x += sign(hveloc);
    }
    hveloc = 0;
}
x += hveloc;

// Colisão vertical
if (place_meeting(x, y + vveloc, obj_parede)) {
    while (!place_meeting(x, y + sign(vveloc), obj_parede)) {
        y += sign(vveloc);
    }
    vveloc = 0;
}
y += vveloc;
