/// @description Insert description here
// You can write your code in this editor
draw_self();
for(var j = 0; j < array_length(itemsSelected); j++){
	if(itemsSelected[j] != -1){
		draw_sprite(itemsSelected[j].sprite, 0, x - 150 + (j*125), y - 100);
	}
}
