global.board_num_x_jewels = 8; //number of jewels on the board x and y
global.board_num_y_jewels = 6;

global.jewels_dist = 10; //distance between jewels

global.jewel_x_size = sprite_get_width(s_jewels); //jewel sprite size
global.jewel_y_size = sprite_get_height(s_jewels);

global.board_off_x = 74; //board offset x and y  we compensate sprite size here
global.board_off_y = 74;

global.board_pos_x = (room_width - (global.board_num_x_jewels * global.jewel_x_size) - (global.board_num_x_jewels-1) * global.jewels_dist) / 2; // DO NOT CHANGE THIS
global.board_pos_y = (room_height - (global.board_num_y_jewels * global.jewel_y_size) - (global.board_num_y_jewels-1) * global.jewels_dist) / 2 + 200;

global.move_sensitivity = 10;       /// It determines how long swipe in the direction must be to triger movement in that direction 
global.matches = ds_list_create(); //holds all matched jewels
global.matchTypes = ds_list_create(); //hold all matched jewel types

global.bottom_limit = global.board_off_y + global.board_pos_y + (global.board_num_y_jewels-1) * (global.jewel_y_size+global.jewels_dist); //jewels higher than this value will not fall
global.up_position = global.board_off_y + global.board_pos_y;   //position for the new jewels

global.num_of_colors = 6;//number of color in the game
global.level_score = 0;//level scor

global.jewel_move_distance = 1;
global.move_back_spd = 0.3; // 1 = maxhow fast jewelse move back to their positions after failed match
global.pause = false;
global.gems_returning = false;

global.movement_dir = -1; //-1 undefined 0 - horizontal 1 - vertical
global.clk = noone; //which jewel is clicked

global.hspds = [-1.2,-1.4,-1.6];



for(i=0; i<global.board_num_x_jewels; i++)
  for(j=0; j<global.board_num_y_jewels; j++)
  {
    xx = global.board_off_x + global.board_pos_x+i*(global.jewel_x_size+global.jewels_dist);
    yy = global.board_off_y + global.board_pos_y+j*(global.jewel_y_size+global.jewels_dist);
    ins = instance_create_depth(xx, yy, 0, o_jewel);
	scrGemDeclare(ins);
  }

scr_backup_jewels();

ins = instance_create_depth(50, 50, 0, o_pause_button);
ins.script = scr_pause;
matchType = noone;





