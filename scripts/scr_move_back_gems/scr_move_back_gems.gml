function scr_move_back_gems() {
	allok = true;
	for(var i=0; i<array_height_2d(global.backup_pos); i++)
	{
	  with(global.backup_pos[i, 0])
	  {
	    if(abs(global.backup_pos[i, 1]-x)>1 || abs(global.backup_pos[i, 2]-y)>1)
	    {
	      x += (global.backup_pos[i, 1] - x)*global.move_back_spd;
	      y += (global.backup_pos[i, 2] - y)*global.move_back_spd;

	      other.allok = false;    
	    }
	    else
	    {
	      x = global.backup_pos[i, 1];
	      y = global.backup_pos[i, 2];
	    }
    
	    move_dest_x = -1;
	    move_dest_y = -1;
	  }
	}

	return allok;




}
