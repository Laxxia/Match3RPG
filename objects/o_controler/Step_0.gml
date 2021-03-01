if(global.pause==true || room != game) exit;

//player is moving jewel 
with(o_jewel)
  if(clicked==true)
  {
    if(move_dir==-1)
    {
      if(point_distance(cx, cy, mouse_x, mouse_y)>=global.move_sensitivity)
      {
        if(abs(mouse_x-cx)>=abs(mouse_y-cy))
        {
          //horizontal movement
          if(mouse_x>=cx) move_dir = 0;
          else move_dir = 180;      
          global.movement_dir = 0;    
        }
        else
        {
          //vertical movement
          if(mouse_y>=cy) move_dir = 270;
          else move_dir = 90;
          global.movement_dir = 1;    
        }
      }   
    }
    else
    {
      if(global.movement_dir = 0) 
      {
        move_dest_x = mouse_x;
        move_dest_y = y;
      }
      if(global.movement_dir = 1)
      {
        move_dest_x = x;
        move_dest_y = mouse_y;
      }
    }
  }   

//jewel movement
if(global.clk!=noone && instance_exists(global.clk) )
{  
  scr_jewel_movement();
}

//moving jewels back to their position
if(global.gems_returning==true)
{
  var val = scr_move_back_gems();
  if(val==true) global.gems_returning = false;
}


//jewel matching
if(instance_exists(o_explosion)==false && scr_is_any_moving()==false && instance_number(o_jewel)==global.board_num_x_jewels*global.board_num_y_jewels && global.gems_returning==false)
{
  scr_align_tiles();
  num = scr_find_matches();
  
  if(num>0)
  {
    mdx = 0; //score position
    mdy = 0;
    mdv = 0; //score value

for(var jj = 0; jj < ds_list_size(global.matchTypes); jj++){
	if(global.matchTypes[| jj].matchSize>=4 && global.matchTypes[| jj].special != noone) //creating special gem when matching >=4
		{
		    m = global.matchTypes[| jj].special;
		    //There's potentially a bug here, take a look when you have a chance
			ins = instance_create_depth(m.x, m.y, 0, o_jewel);
			ins.image_speed = 0;
		    ins.image_index = m.image_index;
			ins.gemType = image_index;
		    ins.iam_special = true;
		}
}
	var special = false;
    for(i=0; i<ds_list_size(global.matches); i++)
    {
      m = global.matches;
      ins = instance_create_depth(m[| i].x, m[| i].y, 0, o_explosion);
      
      mdx += m[| i].x;
      mdy += m[| i].y;
      if(m[| i].iam_special==true) {mdv += 10; special = true;}
      else mdv += 1;
      with(m[| i]){ 
		  instance_destroy();
	  }
    }
	
	//Match Actions AND later, pass how many are getting matched in order to empower the action
	if(ds_list_size(global.matchTypes) > 0){
		for(var i = 0; i < ds_list_size(global.matchTypes); i++){
			scrMatchAction(global.matchTypes[| i].gemAction, global.matchTypes[| i].matchSize, special);
		}
		ds_list_clear(global.matchTypes);
	}
	
	if(ds_list_size(global.matches)>0)
    {
      mdx /= ds_list_size(global.matches);
      mdy /= ds_list_size(global.matches);
      
      ins = instance_create_depth(mdx, mdy, -10, o_score);
      ins.my_val = mdv;
      global.level_score += mdv;
    }
  }
}
  
  
  
//jewel falling
if(instance_exists(o_explosion)==false && scr_is_any_moving()==false && global.gems_returning==false)
{
  with(o_jewel)
  {
    if(y<global.bottom_limit && place_meeting(x, y+(global.jewel_y_size+global.jewels_dist), o_jewel)==false)
    {
      move_dest_x = x;
      move_dest_y = y + (global.jewel_y_size+global.jewels_dist);
    }
  }
}

//replenising jewels
if(instance_exists(o_explosion)==false && scr_is_any_moving()==false && global.gems_returning==false)
{
  for(i=0; i<global.board_num_x_jewels; i++)
  {
    xx = global.board_off_x + global.board_pos_x+i*(global.jewel_x_size+global.jewels_dist);
    yy = global.up_position;
  
    if(instance_position(xx, yy, o_jewel)==noone)
    {
      ins = instance_create_depth(xx, yy, 0, o_jewel);
	  scrGemDeclare(ins);
    }
  }
}


//removing overlapping jewels
if(instance_number(o_jewel)>global.board_num_x_jewels*global.board_num_y_jewels) 
{
  show_debug_message("REMOVING");
  with(o_jewel)
  {
    ins = instance_place(x, y, o_jewel);
    if(ins!=noone && instance_exists(ins))
    {
      with(ins) instance_destroy();
    }
  }
}

