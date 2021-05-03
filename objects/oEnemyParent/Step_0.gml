/// @description Insert description here
// You can write your code in this editor
if(global.pause){exit;}
switch(state){
	case "approach":
		enemyMove();
	break;
	case "attack":
		scrParallaxControl(true);
		alarm[0] = room_speed*attackSpeed;
		state = "attacking";
	break;
}
