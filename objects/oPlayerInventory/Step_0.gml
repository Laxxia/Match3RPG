/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("I"))) { show_inventory = !show_inventory; }

if(!show_inventory) exit;
#region Mouse Slot
mouseX = device_mouse_x_to_gui(0);
mouseY = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size+x_buffer)*scale;
var cell_ybuff = (cell_size+y_buffer)*scale;

var i_mousex = mouseX - slots_x;
var i_mousey = mouseY - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;


if(nx >= 0 && nx < inv_slots_width && ny >= 0 && ny < inv_slots_height){
	var sx = i_mousex - (nx*cell_xbuff); 
	var sy = i_mousey - (ny*cell_ybuff);
	
	if((sx < cell_size*scale) && (sy < cell_size*scale)){
		m_slotx = nx;
		m_sloty = ny;
	}

}
#endregion

//Pick up item
selected_slot = m_slotx + (m_sloty*inv_slots_width);
var inv_grid = ds_inventory;
var ss_item = inv_grid[# m_sloty, m_slotx];
if(pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(ss_item == -1){
			inv_grid[# m_sloty, m_slotx] = pickup_slot;
			inv_grid[# py, px] = -1;
			pickup_slot = -1;
			
		} /*else if( ss_item == inv_grid[# 0, pickup_slot]){
			if(selected_slot != pickup_slot){
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];
				inv_grid[# 0, pickup_slot] = item.none;
				inv_grid[# 1, pickup_slot] = 0;
			} 
			pickup_slot = -1;}*/ 
			else {
			var hold = ss_item;
			inv_grid[# m_sloty, m_slotx] = pickup_slot;
			
			inv_grid[# py, px] = hold;
			pickup_slot = -1;
		}
	} 
	if(mouse_check_button_pressed(mb_right)){
		//check to see it's equipable
		scrEquip(inv_grid[# m_sloty, m_slotx], m_slotx, m_sloty);
		//Equiping the gear
	}

} else if(ss_item != -1){
	if(mouse_check_button_pressed(mb_left)){
		pickup_slot = inv_grid[# m_sloty, m_slotx];
		pickup_sslot = selected_slot;
		px = m_slotx;
		py = m_sloty;
	}
}