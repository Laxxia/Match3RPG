draw_set_alpha(image_alpha);
draw_set_font(font0); 
draw_set_color(c_black); 
draw_text(x, y, string_hash_to_newline(my_val));
draw_set_color(c_white); 
draw_text(x+2, y+2, string_hash_to_newline(my_val));
draw_set_alpha(1);


