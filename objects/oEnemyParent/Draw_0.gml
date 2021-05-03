/// @description Insert description here
// You can write your code in this editor
if(curHP < maxHP){
	draw_sprite_stretched(sprHealthBar, 1, x - 25, y - 100, 100 , 20);
	draw_sprite_stretched(sprHealthBar, 0, x - 25, y - 100, (curHP/maxHP)* 100, 20);
}
draw_text(x, y + sprite_height, string(alarm[0]/room_speed));
draw_self();