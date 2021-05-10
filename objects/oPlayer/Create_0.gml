/// @description Insert description here
// You can write your code in this editor
state = undefined;

animateOnce = false;

tempDamage = -1;

function animationEndCheck(){
	if(image_index >= image_number - 1){
		return true;
	} else return false;
}

stateChange = function(_state, _sprite, _animateOnce){
		state = _state;
		animateOnce = _animateOnce;
		sprite_index = _sprite;
		image_index = 0;
}

stateChange(playerState.walking, s_charWalk, false);

enum playerState{
	idle,
	hurt,
	walking,
	attacking
}