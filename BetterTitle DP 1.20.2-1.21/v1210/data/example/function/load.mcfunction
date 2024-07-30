
scoreboard objectives add example.int dummy

execute unless score ExamplePanel example.int matches 0.. store result score ExamplePanel example.int run function title:new_panel
# 创建新面板

data merge storage title:io {  \
    text:'{"text":"这是一个示例","color":"red"}',  \
    font:"minecraft:default_mod",  \
    neg_font:"minecraft:default_neg",  \
    x: 0,  y: 0,  \
    align:"middle",  \
    origin:"center"  \
}
function title:new_text
# 示例文本

scoreboard players operation panel_id title.io = ExamplePanel example.int
function title:replace_panel
# 设置面板内容

