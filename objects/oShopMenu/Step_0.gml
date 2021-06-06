/// @description Insert description here
// You can write your code in this editor
var button_clicked = noone;
for (var i = 0; i < itemCount; i ++) {
  if(itemsSelected[i] != -1){
	  var x1 = (x - 150) + (i*125),
	      y1 = y - 100,
	      x2 = x1 + sprite_get_width(itemsSelected[i].sprite),
	      y2 = y1 + sprite_get_height(itemsSelected[i].sprite);
	  var mouseover = point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2),
	      click = mouse_check_button_pressed(mb_left);
	  if (mouseover && click) {
	    button_clicked = i;
	    break;
	  }
  }
}
if (button_clicked != noone) {
	if(purchase(itemsSelected[button_clicked])){
		oDragDropController.createAndGive(itemsSelected[button_clicked], oDragDropController.inventoryGroup);
		itemsSelected[button_clicked] = -1;
	}
}