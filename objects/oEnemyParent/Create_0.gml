/// @description Insert description here
// You can write your code in this editor
curHP = 6;
maxHP = curHP;
moveSpeed = 5;
attack = 2;
attackSpeed = 7;
actions = ["attack"];
spriteArray = [-1, -1, -1, -1];
animateOnce = false;
state = undefined;
//Dying can potentially be a delegate, lets think on that longer

//functions similar to the player should be done here for sure, maybe pass an array of sprite options
//to keep the funcitons super simple for all enemies


function animationEndCheck(){
	if(image_index >= image_number - 1){
		return true;
	} else return false;
}

enemyStateChange = function(_state, _sprite, _animateOnce){
		state = _state;
		animateOnce = _animateOnce;
		sprite_index = _sprite;
		image_index = 0;
}

enemyStateChange(enemyState.walking, spriteArray[enemyState.walking], false);

enum enemyState{
	idle = 0,
	hurt = 1,
	walking = 2,
	attacking = 3
}
//finish wokring on this


enemyTakeDamage = function(damage){
	if(state != enemyState.attacking){
		enemyStateChange(enemyState.hurt, spriteArray[enemyState.hurt], true);
	}
	curHP -= damage;
	if(curHP <= 0){
		//Right now the enemy will just wink out, have it so it happens at the end of the damage animation or somehting
		killInstance();
	}
}

killInstance = function(){
	oCharacterData.setTarget(noone);
	oPlayer.stateChange(playerState.walking, s_charWalk, false);
	//Essentially resume walking, so start the spawner up again, AND start the path moving again.
	oEnemySpawner.alarm[0] = oEnemySpawner.spawnRate * room_speed;
	oCharacterData.gainExperience(200);
	scrParallaxControl(false);
	instance_destroy();
}

attackPlayer= function(attack){
	oCharacterData.takeDamage(attack)
}

enemyHeal = function(healValue){
	if(curHP == maxHP){return false;}
	if(curHP + healValue > maxHP){
		curHP = maxHP;
	} else {curHP += healValue;}
}

enemyMove = function(){
	if(position_meeting(x - ((sprite_width/2) + (moveSpeed *5)) , y, oPlayer)){
		enemyStateChange(enemyState.idle, spriteArray[enemyState.idle], false);
		alarm[0] = room_speed * attackSpeed;
		scrParallaxControl(true);
		oCharacterData.setTarget(id);
		oPlayer.stateChange(playerState.idle, s_charIdle, false);
	} else {x -= moveSpeed;}
}