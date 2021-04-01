function scr_is_any_moving() {
	moving = false;
	with(o_jewel)
	{    
	  if(move_dir!=-1 || move_dest_x!=-1 || move_dest_y!=-1 || clicked==true) other.moving = true;
	}

	return moving;




}
