function scr_jewel_movement() {
	  xmin = global.board_off_x + global.board_pos_x+0*(global.jewel_x_size+global.jewels_dist);
	  xmax = global.board_off_x + global.board_pos_x+(global.board_num_x_jewels-1)*(global.jewel_x_size+global.jewels_dist);
  
	  ymin = global.board_off_y + global.board_pos_y+0*(global.jewel_y_size+global.jewels_dist);
	  ymax = global.board_off_y + global.board_pos_y+(global.board_num_y_jewels-1)*(global.jewel_y_size+global.jewels_dist);
  
	  if(global.movement_dir==0)
	  {
	    empx = -1;
	    empy = -1;
	    pos = 0;
	    c = global.clk;
	    table = 0;
    

	    if(c!=noone && instance_exists(c))
	      for(i=xmin; i<=xmax; i+= global.jewel_x_size+global.jewels_dist)
	      {      
	        if(instance_position(i, c.y, o_jewel)==noone)
	        {
	          empx = i;
	          empy = c.y;    
	          break;        
	        }
             
	        pos++;
	      }
    
	    //checking is any moving
	    is_moving = false;
	    /*with(o_jewel)
	    {
	      if(move_dest_x!=-1 || move_dest_y!=-1) other.is_moving = true;
	    }*/
    
	    if(is_moving==false && empx!=-1 && empy!=-1)
	    {
	      lbal = 0;
	      rbal = 0;

	      with(o_jewel)
	      {
	        c = global.clk;
	        if(c!=noone && instance_exists(c))
	          if(y==c.y) 
	          {
	            if(x<other.empx) other.lbal++;
	            if(x>other.empx) other.rbal++;
	          }
	      }

	      if(lbal==pos && rbal>global.board_num_x_jewels-pos-1) 
	      {
	        with(o_jewel)
	        {
	          c = global.clk;
	          if(c!=noone && instance_exists(c))
	            if(x==other.empx+(global.jewel_x_size+global.jewels_dist) && clicked==false && y==c.y)
	            {
	              move_dest_x = other.empx;
	              move_dest_y = y;
	            }
	        }
	      }
      
	      if(lbal>pos && rbal==global.board_num_x_jewels-pos-1) 
	      {
	        with(o_jewel)
	        {
	          c = global.clk;
	          if(c!=noone && instance_exists(c))
	            if(x==other.empx-(global.jewel_x_size+global.jewels_dist) && clicked==false && y==c.y)
	            {
	              move_dest_x = other.empx;
	              move_dest_y = y;
	            }
	        }
	      }
	    }    
	  }
 
	  if(global.movement_dir==1)
	  {
	    empx = -1;
	    empy = -1;
	    pos = 0;
	    c = global.clk;
	    table = 0;

	    if(c!=noone && instance_exists(c))
	      for(i=ymin; i<=ymax; i+=global.jewel_y_size+global.jewels_dist)
	      {      
	        if(instance_position(c.x, i, o_jewel)==noone)
	        {
	          empx = c.x;
	          empy = i;            
	          break;        
	        }
             
	        pos++;
	      }
    
	    //checking is any moving
	    is_moving = false;
	    /*with(o_jewel)
	    {
	      if(move_dest_x!=-1 || move_dest_y!=-1) other.is_moving = true;
	    }*/
    
	    if(is_moving==false && empx!=-1 && empy!=-1)
	    {
	      ubal = 0;
	      dbal = 0;

	      with(o_jewel)
	      {
	        c = global.clk;
	        if(c!=noone && instance_exists(c))
	          if(x==c.x) 
	          {
	            if(y<other.empy) other.ubal++;
	            if(y>other.empy) other.dbal++;
	          }
	      }

	      if(ubal==pos && dbal>global.board_num_y_jewels-pos-1) 
	      {
	        with(o_jewel)
	        {
	          c = global.clk;
	          if(c!=noone && instance_exists(c))
	            if(y==other.empy+(global.jewel_y_size+global.jewels_dist) && clicked==false && x==c.x)
	            {
	              move_dest_x = x
	              move_dest_y = other.empy;
	            }
	        }
	      }
      
	      if(ubal>pos && dbal==global.board_num_y_jewels-pos-1) 
	      {
	        with(o_jewel)
	        {
	          c = global.clk;
	          if(c!=noone && instance_exists(c))
	            if(y==other.empy-(global.jewel_y_size+global.jewels_dist) && clicked==false && x==c.x)
	            {
	              move_dest_x = x;
	              move_dest_y = other.empy;
	            }
	        }
	      }
	    }    
	  }



}
