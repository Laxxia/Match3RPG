/// @description Insert description here
// You can write your code in this editor
moveSpeed = 0;
state = shopState.approaching;


function animationEndCheck(){
	if(image_index >= image_number - 1){
		return true;
	} else return false;
}

shopStateChange = function(_state){
		state = _state;	
		//When its an animated thing add  _sprite and _animateOnce back to the arguments
		//sprite_index = _sprite;
		//animateOnce = _animateOnce;
		//image_index = 0;
}



shopApproach = function(){
	if(position_meeting(x - ((sprite_width/2) + (moveSpeed * 5)) , y, oPlayer)){
		shopStateChange();
		scrParallaxControl(true);
		oCharacterData.setTarget(id);
		oPlayer.stateChange(playerState.idle, s_charIdle, false);
		global.pause = true;
		var ins = instance_create_layer(room_width/2, room_height/2, "Menus", oShopMenu);
	} else {x -= moveSpeed;}
}

leaveShop = function(){
	oCharacterData.setTarget(noone);
	oPlayer.stateChange(playerState.walking, s_charWalk, false);
	//Essentially resume walking, so start the spawner up again, AND start the path moving again.
	
	//This is where we just progress the spawner.
	var range = irandom_range(1, oEnemySpawner.spawnRate) 
	oEnemySpawner.alarm[0] = range * room_speed;
	scrParallaxControl(false);
	global.pause = false;
	instance_destroy();
}


enum shopState{
	approaching,
	opening,
	shopping
}