/// @description Insert description here
// You can write your code in this editor
if(!show_inventory) exit;

//-------Inventory Back
draw_sprite_part_ext(
	spr_inv_UI, 0, cell_size, 0, inv_UI_width, inv_UI_height, 
	inv_UI_x, inv_UI_y, scale, scale, c_white, 1
);

//------Inventory
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;

repeat(inv_slots){
	//x,y location for slot
	xx = slots_x + ((cell_size+x_buffer)*ix*scale);
	yy = slots_y + ((cell_size+y_buffer)*iy*scale);
	
	//Item
	iitem = inv_grid[# iy, ix];
	
	//Draw Slot and Item
	draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	switch(ii){
		case selected_slot:
			if(iitem != -1) draw_sprite(iitem.lookUp.sprite, 0, xx, yy);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, .3);
			gpu_set_blendmode(bm_normal);
		
		break;
		
		default:
			if(iitem !=  -1){
				draw_sprite(iitem.lookUp.sprite, 0, xx, yy);
			}
			break;
	}
	
	//Draw item Number
	/*(
	if(iitem > 0){
		var number = inv_grid[# 1, ii];
		draw_text_color(xx, yy, string(number), c,c,c,c, 1);
	}
	*/
	//Increment
	ii += 1;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width;
}

if(pickup_slot != -1){
	draw_sprite(pickup_slot.lookUp.sprite, 0, mouseX, mouseY);
	
}

