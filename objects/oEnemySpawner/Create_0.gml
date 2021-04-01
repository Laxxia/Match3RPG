/// @description Insert description here
// You can write your code in this editor
spawnRate = 15;
alarm[0] = room_speed*spawnRate;

enemyTypes = ds_list_create();
ds_list_add(enemyTypes, enemies.frog);