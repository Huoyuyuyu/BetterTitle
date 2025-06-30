
scoreboard objectives add example.int dummy

function title:new_panel {id: "ExamplePanel example.int"}
# 创建新面板“示例面板”,  并返回指针到计分板中



data merge storage title:io {  \
    text: '{"text":"这是一个示例","color":"red"}',  \
    font: "minecraft:default_mod",  \
    neg_font: "minecraft:default_neg",  \
    x: 0,  y: 0,  \
    align: "middle",  \
    origin: "center"  \
}
function title:new_text

data merge storage title:io {  \
    text: '{"text":"如果这段文本在屏幕中央 则安装成功","color":"white"}',  \
    y: -10,  \
}
function title:new_text
# 创建示例文本



scoreboard players operation panel_id title.io = ExamplePanel example.int
function title:replace_panel
# 用指针选中“示例面板”,  设置面板内容为刚刚创建的“示例文本”



