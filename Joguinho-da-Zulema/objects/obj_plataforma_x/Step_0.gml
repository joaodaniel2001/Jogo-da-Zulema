
hveloc = dir * vveloc;

if (instance_place(x+hveloc,y,obj_colisao)){
	dir*=-1;
}

var _colisao = place_meeting(x+vveloc,y,obj_player_01) or place_meeting(x,y -1, obj_player_01);

if (_colisao){
	with(obj_player_01){
		if (!place_meeting(x+other.hveloc,y,obj_colisao)){
			x += other.hveloc;
		}
	}
}

x += hveloc;