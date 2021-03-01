function scr_find_matches() {
	var temp, found, i, j, gem, prevGem,tempType; 

	ds_list_clear(global.matches);
	ds_list_clear(global.matchTypes);
	
	tempType = ds_list_create();
	temp = ds_list_create();
	found = ds_list_create();

	//horizontal check
	prevGem = noone;
	for(j=0; j<global.board_num_y_jewels; j++)  
	{  
	  ds_list_clear(temp);  
	  for(i=0; i<global.board_num_x_jewels; i++)  
	  {  
	    xx = global.board_off_x + global.board_pos_x+i*(global.jewel_x_size+global.jewels_dist);
	    yy = global.board_off_y + global.board_pos_y+j*(global.jewel_y_size+global.jewels_dist);
	    gem = instance_position(xx, yy, o_jewel);   
    
	    if(gem!=noone)
	    {
	      if(prevGem==noone) 
	      {
	        ds_list_add(temp, gem); 
	        prevGem = gem;       
	      }
	      else
	      {
			if(prevGem.image_index==gem.image_index) 
	        {
	          ds_list_add(temp, gem);                   
	          prevGem = gem;
	        }
	        else
	        {          
	          if(ds_list_size(temp)>=3)  
	          {
				var match = new scrNewMatch(temp, temp[| 0].gemType);
				ds_list_add(tempType, match); 
				for(ii=0; ii<ds_list_size(temp); ii++)
	              ds_list_add(found, temp[| ii]);
	            ds_list_clear(temp);
            
	            ds_list_add(temp, gem); 
	            prevGem = gem;            
	          }
	          else
	          {
	            ds_list_clear(temp); 
	            ds_list_add(temp, gem);          
	            prevGem = gem; 
	          }
	        }
	      }   
	    }
	  }
  
	  if(ds_list_size(temp)>=3)
	  {
		var match = new scrNewMatch(temp, temp[| 0].gemType);
		ds_list_add(tempType, match); 
		for(ii=0; ii<ds_list_size(temp); ii++)
	      ds_list_add(found, temp[| ii]);
	  }
	  else
	  {
	    ds_list_clear(temp);            
	  }    
	}  

	//vertical
	prevGem = noone;
	for(i=0; i<global.board_num_x_jewels; i++)  
	{  
	  ds_list_clear(temp);  
	  for(j=0; j<global.board_num_y_jewels; j++)  
	  {  
	    xx = global.board_off_x + global.board_pos_x+i*(global.jewel_x_size+global.jewels_dist);
	    yy = global.board_off_y + global.board_pos_y+j*(global.jewel_y_size+global.jewels_dist);
	    gem = instance_position(xx, yy, o_jewel);      
    
	    if(gem!=noone)
	    {
	      if(prevGem==noone) 
	      {
	        ds_list_add(temp, gem); 
	        prevGem = gem;       
	      }
	      else
	      {
	        if(prevGem.image_index==gem.image_index) 
	        {
	          ds_list_add(temp, gem);                   
	          prevGem = gem;
	        }
	        else
	        {          
	          if(ds_list_size(temp)>=3)  
	          {
				var match = new scrNewMatch(temp, temp[| 0].gemType);
				ds_list_add(tempType, match); 
				for(ii=0; ii<ds_list_size(temp); ii++)
	              ds_list_add(found, temp[| ii]);
	            ds_list_clear(temp);
            
	            ds_list_add(temp, gem); 
	            prevGem = gem;            
	          }
	          else
	          {
	            ds_list_clear(temp); 
	            ds_list_add(temp, gem);          
	            prevGem = gem; 
	          }
	        }
	      }            
	    }
	  }
  
	  if(ds_list_size(temp)>=3)
	  { 
		var match = new scrNewMatch(temp, temp[| 0].gemType);
		ds_list_add(tempType, match); 
		for(ii=0; ii<ds_list_size(temp); ii++)
	      ds_list_add(found, temp[| ii]);
	  }
	  else
	  {
	    ds_list_clear(temp);            
	  }    
	}  

	for(ii=0; ii<ds_list_size(found); ii++)  
	{  
	  if(ds_list_find_index(global.matches, found[| ii]) == -1 && instance_exists(found[| ii]))  
	  {
	    ds_list_add(global.matches, found[| ii]);
	  }
	  if(ii < ds_list_size(tempType)){
			ds_list_add(global.matchTypes, tempType[| ii]);
		}
	}
  
	ds_list_destroy(temp);
	ds_list_destroy(found);
	ds_list_destroy(tempType);
	return ds_list_size(global.matches);





}
