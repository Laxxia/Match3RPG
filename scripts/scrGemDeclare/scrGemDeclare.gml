// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrGemDeclare(ins){
    ins.image_speed = 0;
    ins.image_index = irandom(global.num_of_colors-1);
	
	switch(ins.image_index){
		case 0:
			ins.gemType = jewelType.attack;
		break;
		case 1:
			ins.gemType = jewelType.luck;
		break;
		case 2:
			ins.gemType = jewelType.shields;
		break;
		case 3:
			ins.gemType = jewelType.mana;
		break;
		case 4:
			ins.gemType = jewelType.gold;
		break;
		case 5:
			ins.gemType = jewelType.charge;
		break;
	}
}