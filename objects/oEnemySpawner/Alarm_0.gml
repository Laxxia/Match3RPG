/// @description Insert description here
// You can write your code in this editor
	var val = irandom_range(0, ds_list_size(enemyTypes) - 1);
	var enemy = ds_list_find_value(enemyTypes, val)
	switch(enemy){
		case enemies.frog:
			var ins = instance_create_depth(1806, 434, -10, oEnemyParent);
			with(ins){
				sprite_index = sprFrogWalk;
				//add all sprites to a list, then access them via an enum so you have a generic script for it
				image_xscale = .375;
				image_yscale = .375; 
				curHP = 12;
				maxHP = curHP;
				moveSpeed = 5;
				attack = 3;
				attackSpeed = 6;
				actions = ["attack"];
			}
		break;
		default:
			instance_create_depth(oPlayer.x + (room_width - oPlayer.sprite_width - 20), oPlayer.y, -10, oEnemyParent);
		break;
	}
	//Probably add some shit here, like setting it's type and shit.