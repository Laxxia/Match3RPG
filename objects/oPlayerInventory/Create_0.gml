depth = -1;
scale = 2;
show_inventory = true;

inv_slots = 24;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0; 
pickup_slot = -1;
pickup_sslot = -1;

m_sloty = 0;
m_slotx = 0;
px = 0;
py = 0;

x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

inv_UI_width = 288;
inv_UI_height = 192;

spr_inv_UI = spr_inventory_UI;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale);
info_y = inv_UI_y + (9 * scale);

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);


//---------Inventory
//0 = ITEM
//1 = NUMBER

ds_inventory = global.characterData.itemInventory;






