// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrEnemyMove(){
	if(position_meeting(x - ((sprite_width/2) + (moveSpeed *5)) , y, oPlayer)){
		state = "attack";
		global.characterData.target = self;
		oPlayer.state = "battle";
	} else {x -= moveSpeed;}
}