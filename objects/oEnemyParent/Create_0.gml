/// @description Insert description here
// You can write your code in this editor
curHP = 6;
maxHP = curHP;
moveSpeed = 5;
attack = 2;
attackSpeed = 7;
actions = ["attack"];

//Dying can potentially be a delegate, lets think on that longer

state = "approach";

enemyTakeDamage = function(damage){
	curHP -= damage;
	if(curHP <= 0){
		killInstance();
	}
}

killInstance = function(){
	oCharacterData.setTarget(noone);
	oPlayer.state = "idle";
	//Essentially resume walking, so start the spawner up again, AND start the path moving again.
	var range = irandom_range(0, oEnemySpawner.spawnRate) 
	oEnemySpawner.alarm[0] = range * room_speed;
	scrParallaxControl(false);
	instance_destroy();
}

attackPlayer= function(attack){
	oCharacterData.takeDamage(attack)
}

enemyMove = function(){
	if(position_meeting(x - ((sprite_width/2) + (moveSpeed *5)) , y, oPlayer)){
		state = "attack";
		oCharacterData.setTarget(id);
		oPlayer.state = "battle";
	} else {x -= moveSpeed;}
}