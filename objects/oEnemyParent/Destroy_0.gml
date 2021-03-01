/// @description Insert description here
// You can write your code in this editor
global.characterData.target = noone;
oPlayer.state = "idle";

//Essentially resume walking, so start the spawner up again, AND start the path moving again.
var range = irandom_range(0, oEnemySpawner.spawnRate) 
oEnemySpawner.alarm[0] = range * room_speed;
scrParallaxControl(false);