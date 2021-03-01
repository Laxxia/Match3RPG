 if(global.pause==true) exit;

//checkim jewel clicks
if(mouse_check_button_pressed(mb_left)==true)
{
  if(instance_position(mouse_x, mouse_y, id)!=noone && instance_exists(o_explosion)==false && scr_is_any_moving()==false && instance_number(o_jewel)==global.board_num_x_jewels*global.board_num_y_jewels && global.gems_returning==false)
  {
    clicked = true;
    with(o_jewel) prev_clicked = false;
    prev_clicked = true;
    global.clk = id;
    cx = mouse_x;
    cy = mouse_y;
    
    scr_backup_jewels();
    
    depth = -10;
  }
}

//releasing jewel from hand and moving back jewels to their positions
if(mouse_check_button(mb_left)==false)
{  
  if(clicked==true) 
  {
    global.movement_dir = -1;
    move_dest_x = -1;
    move_dest_y = -1;
  
    scr_align_tiles();
    num = scr_find_matches();
    if(num==0) with(o_controler) global.gems_returning = true;
  }
  
  clicked = false;
  global.clk = noone;
    
  cx = 0;
  cy = 0;
  
  move_dir = -1;
  
  depth = 0;  
}


if(move_dest_x!=-1 || move_dest_y!=-1)
{
  x += (move_dest_x - x)*0.75;
  y += (move_dest_y - y)*0.75;
  
  if(point_distance(x, y, move_dest_x, move_dest_y)<5)
  {
    x = move_dest_x;
    y = move_dest_y;
    move_dest_x = -1;
    move_dest_y = -1;     
  }
}


  

