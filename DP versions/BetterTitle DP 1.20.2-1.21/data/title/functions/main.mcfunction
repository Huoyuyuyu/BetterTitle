
data merge storage title:io {  \
    text:'{"nbt":"time","storage":"title:example","color":"white"}',  \
    font:"minecraft:default_mod",  \
    neg_font:"minecraft:default_neg",  \
    x: 0,  y: -15,  \
    align:"middle",  \
    origin:"up"  \
}
function title:new_part
function title:new_text

data merge storage title:io {  \
    text:'[  \
        {"text":"名称: ","color":"gray"},  \
        {"selector":"@s","color":"dark_aqua"}  \
    ]',  \
    x: 5,  y: -15,  \
    align:"left",  \
    origin:"up-left"  \
}
function title:new_part
function title:new_text

data merge storage title:io {  \
    text:'[  \
        {"text":"❤ ","color":"red"},  \
        {"score":{"name":"@s","objective":"health"},"color":"red"},  \
        {"text":"   🍖 ","color":"#B88458"},  \
        {"score":{"name":"@s","objective":"food"},"color":"#B88458"},  \
        {"text":"   🛡 ","color":"#a9a9bb"},  \
        {"score":{"name":"@s","objective":"armor"},"color":"#a9a9bb"}  \
    ]',  \
    x: 5, y: -25  \
}
function title:new_part
function title:new_text

data merge storage title:io {  \
    text:'[  \
        {"score":{"name":"@s","objective":"death"},"color":"dark_red"},  \
        {"text":" ☠","color":"dark_red"}  \
    ]',  \
    x: -5, y: -25,  \
    align:"right",  \
    origin:"up-right"  \
}
function title:new_part
function title:new_text

data merge storage title:io {  \
    text:'[  \  
        {"score":{"name":"@s","objective":"money"},"color":"gold"},  \
        {"text":" ₿","color":"gold"}  \
    ]',  \
    x: -5, y: -35  \
}
function title:new_part
function title:new_text

data merge storage title:io {  \
    text:'[  \
        {"text":"1"}  \
    ]',  \
    x: 5, y: 0,  \
    align:"left",  \
    origin:"left"  \
}
function title:new_part
function title:new_text

scoreboard players operation panel_id title.io = MainPanel example.int
function title:replace_panel



