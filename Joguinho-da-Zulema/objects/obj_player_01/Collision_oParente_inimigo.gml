
if other.vida > 0{
	
	if alarm[0] <= 0{
	
		vida -=1;
		alarm[0] = inv_tempo; // 3 segundos não podendo tomar hit
		
	}
}