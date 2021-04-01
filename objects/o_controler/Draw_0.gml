draw_set_font(font0); 
draw_set_color(c_white); 
str = string(global.level_score);
draw_text(room_width-string_width(string_hash_to_newline(str))-25, y, string_hash_to_newline(str));


