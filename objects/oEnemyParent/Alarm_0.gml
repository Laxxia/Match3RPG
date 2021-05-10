/// @description Insert description here
// You can write your code in this editor
var choice = actions[ irandom_range(0, array_length(actions)-1) ]
switch(choice){
	case "attack":
	enemyStateChange(enemyState.attacking, spriteArray[enemyState.attacking], true);
	break;
}
alarm[0] = room_speed*attackSpeed;