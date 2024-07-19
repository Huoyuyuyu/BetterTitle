
# 新文本

execute store result score x title.int run data get storage title:io x 1.0
execute store result storage title:io tempx int 1.0 run scoreboard players add x title.int 5000

execute store result score y title.int run data get storage title:io y 1.0
execute store result storage title:io tempy int 1.0 run scoreboard players add y title.int 5000

function title:code/new_text_macro with storage title:io
