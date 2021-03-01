draw_self();

//selection indication change this to make different selection appearance
if(clicked==true) 
{
 	draw_set_alpha(0.2);
 	draw_set_color(c_white); 
 	draw_circle(x, y, 75, false);
 	draw_set_alpha(1);
}

//change this to alter special gem look -------------------------------------------
if(iam_special==true)
{
 	draw_set_font(font0); 
  	sw = string_width(string_hash_to_newline("!!!"))*0.5;
  	sh = string_height(string_hash_to_newline("!!!"))*0.5;
 	draw_set_color(c_black); 
 	draw_text(x-sw, y-sh, string_hash_to_newline("!!!"));
 	draw_set_color(c_white); 
 	draw_text(x+2-sw, y+2-sh, string_hash_to_newline("!!!"));
}
///-------------------------------------------


