
// Tecla de tela cheia
if keyboard_check_pressed(vk_f8)
	{
		window_set_fullscreen(!window_get_fullscreen());
	}

// Sair se não houver jogador
if !instance_exists(obj_player_01) exit;

// Obter tamanho da câmera
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// Obter as coordenadas alvo da câmera
var _camX = obj_player_01.x - _camWidth / 2;
var _camY = obj_player_01.y - _camHeight / 2;

_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

// Colocando as coordenadas das váriaveis da câmera
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

// Definir coordenadas da câmera
camera_set_view_pos(view_camera[0], _camX, _camY);