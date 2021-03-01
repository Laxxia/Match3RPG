function scr_align_tiles() {
	with(o_jewel)
	{
	  min_dst = 10000;
	  min_i = -1;
	  min_j = -1;
  
	  for(i=0; i<global.board_num_x_jewels; i++)
	    for(j=0; j<global.board_num_y_jewels; j++)
	    {
	      xx = global.board_off_x + global.board_pos_x+i*(global.jewel_x_size+global.jewels_dist);
	      yy = global.board_off_y + global.board_pos_y+j*(global.jewel_y_size+global.jewels_dist);
    
	      var d = point_distance(x, y, xx, yy);
      
	      if(d<min_dst)
	      {
	        min_dst = d;
	        min_i = i;
	        min_j = j;
	      }
	    }
  
	  x = global.board_off_x + global.board_pos_x+min_i*(global.jewel_x_size+global.jewels_dist);
	  y = global.board_off_y + global.board_pos_y+min_j*(global.jewel_y_size+global.jewels_dist);
	}




}
