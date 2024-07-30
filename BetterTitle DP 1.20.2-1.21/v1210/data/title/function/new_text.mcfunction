
# 新文本

function title:new_part

execute store result score x title.int run data get storage title:io x 2.0
execute store result score dx title.int run data get storage title:io dx 2.0
scoreboard players operation x title.int += dx title.int
execute store result storage title:io x double 0.5 run scoreboard players get x title.int
execute store result storage title:io tempx int 1.0 run scoreboard players add x title.int 4000
data modify storage title:io dx set value 0

execute store result score y title.int run data get storage title:io y 2.0
execute store result score dy title.int run data get storage title:io dy 2.0
scoreboard players operation y title.int += dy title.int
execute store result storage title:io y double 0.5 run scoreboard players get y title.int
execute store result storage title:io tempy int 1.0 run scoreboard players add y title.int 2500
data modify storage title:io dy set value 0

function title:code/new_text_macro with storage title:io

