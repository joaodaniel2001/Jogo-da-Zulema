
var _sprl = sprite_get_width(sHeart);
var _buffer = 20;
var _vidas = obj_player_01.vida;

for (var i = 0; i < _vidas; i++;){
	draw_sprite_ext(sHeart, 0, 20 + (_sprl * i) + (_buffer * i), 20, 2, 2, 0, c_white, 1);
}