/// @description Insert description here
// You can write your code in this editor
if(point_in_rectangle(mouse_x, mouse_y, x, y, x+sprite_width, y+sprite_height)){
	HoveredStart.Invoke();
} else {HoveredEnd.Invoke();}



/*if(point_in_rectangle(mouse_x, mouse_y, x, y, x+sprite_width, y+sprite_height)){
	onHoverBegin();
} else {onHoverEnd();} */