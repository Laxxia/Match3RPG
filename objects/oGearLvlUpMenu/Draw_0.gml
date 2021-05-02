/// @description Insert description here
// You can write your code in this editor
draw_self();

if(targetItem != undefined){
	draw_text(x, y + 50, targetItem.level);
}

if(targetItem != undefined){
	draw_sprite_ext(targetItem.lookUp.sprite, 0, x - ((sprite_width/2) - buffer), y - sprite_height/3, 2, 2, 1, c_white, 1);
}