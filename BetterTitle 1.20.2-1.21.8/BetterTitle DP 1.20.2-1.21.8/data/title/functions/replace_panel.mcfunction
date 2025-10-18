
execute store result storage title:io panel_id int 1.0 run scoreboard players get panel_id title.io
function title:code/replace_panel_macro with storage title:io
data modify storage title:io panel_buffer set value '""'