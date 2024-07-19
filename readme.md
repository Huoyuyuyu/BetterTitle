
# BetterTitle

### 目录

- [简介](#简介)
- [接口](#接口)
    - [新面板 new_panel](#新面板)
    - [新部分 new_part](#新部分)
    - [新文本 new_text](#新文本)
    - [更新面板 replace_panel](#更新面板)
- [示例](#示例)
    - [显示玩家名](#显示玩家名)
- [负空格字体](#负空格字体)

### 简介 

一个基于负空格和着色器实现的**多文本操作库**

版本：Java 1.20.4 原版

作者：火昱Huoyu

### 接口

该文本库目前有 4 个核心接口函数

均以 title:<接口名> 命名

在id为 `title:io` 的storage下储存所有nbt

请使用data merge的方式输入，不乱动其中的数据

该文本库的所有接口函数只需要执行一次

不需要每tick都执行

建议在load中执行

***

##### 新面板

执行 `new_panel` 函数可以创建一个新的空白面板，并返回一个指针

“ 面板 ” 即要向玩家展示的所有的文本

*示例：*

    execute store result score PlayerNamePanel example.int run function title:new_panel
    
*在1.20.2及以下版本中，使用不同的返回方式：*

    function title:new_panel
    scoreboard players operation PlayerNamePanel example.int = panel_id title.io

可以将函数的返回值存在一个你喜欢的计分板分数中，名字不一定是PlayerNamePanel，计分板也不一定是example.int，但最好是一个没人用到的计分板

这样相当于创建了一个面板，并且用 PlayerNamePanel 表示了它

文本库里还提供了一个计分板 `title.panel_id` 用于表示玩家将看到的面板

可以用以下命令切换玩家的面板：

    scoreboard players operation @s title.panel_id = PlayerNamePanel example.int

***

##### 新部分

执行 `new_part` 函数可以在缓冲中创建一个新的文本部分

*示例：*

    data merge storage title:io {  \
        text:'[  \
            {"text":"Name: ","color":"gray"},  \
            {"selector":"@s","color":"dark_aqua"}  \
        ]',  \
        font:"minecraft:default",  \
        neg_font:"minecraft:default_neg",  \
    }
    function title:new_part

需要3个变量：

`text` 输入的文本，需要一段原始json文本，**不可使用字体功能**（默认无）

`font` 这部分文本使用的**字体**（默认为 minecraft:default_mod，即原版字体）

`neg_font` 这部分文本使用的**负空格字体**，详见 [负空格字体](#负空格字体)（默认为 minecraft:default_neg）

***

##### 新文本

执行 `new_text` 函数可以在缓冲中创建一个新的文本

执行后，会将new_part函数添加的所有**部分**组合成一个**文本**

（因为每个部分只能使用一种字体，所以需要用多个部分组成一个文本）

并将这个文本放到屏幕指定位置

每一个text都是独立的，互不影响

*示例：*

    data merge storage title:io {  \
        x: 5,  y: -15,  \
        align:"left",  \
        origin:"up-left"  \
    }
    function title:new_text

需要4个变量：

`x` `y` 该文本相对原点的偏移（默认为0）

`align` 该文本的对齐方式（可以是left、right、middle中的一个，默认为middle）

`origin` 该文本的原点位置（可以是default、up、down、left、right、up-left、up-right、down、down-left、down-right、center中的一个，默认为default，也就是原版位置）

在x:0, y:0, align:"middle"时，改变origin，大致效果如下图:

![原点示意图](/image/原点示意图.png)

也可以将两者结合起来

*示例：*

    data merge storage title:io {  \
        text:'[  \
            {"text":"Name: ","color":"gray"},  \
            {"selector":"@s","color":"dark_aqua"}  \
        ]',  \
        font:"minecraft:default",  \
        neg_font:"minecraft:default_neg",  \
        x: 5,  y: -15,  \
        align:"left",  \
        origin:"up-left"  \
    }
    function title:new_part
    function title:new_text

***

##### 更新面板

执行 `replace_panel` 可以更新面板

执行后，会将new_text函数添加的所有**文本**组合成一个**面板**，并根据输入的id更新面板内容

*示例：*

    scoreboard players operation panel_id title.io = PlayerNamePanel example.int
    function title:replace_panel

`panel_id` 一个特殊分数，值为将被更新内容的面板的指针

***

### 示例

##### 显示玩家名

将玩家的名称显示在左上角

将上面的四个示例结合起来：

init函数：

    scoreboard objectives add example.int dummy
    execute store result score PlayerNamePanel example.int run function title:new_panel

load函数：（或者写在init里也行，没啥影响）

    data merge storage title:io {  \
        text:'[  \
            {"text":"Name: ","color":"gray"},  \
            {"selector":"@s","color":"dark_aqua"}  \
        ]',  \
        font:"minecraft:default",  \
        neg_font:"minecraft:default_neg",  \
        x: 5,  y: -15,  \
        align:"left",  \
        origin:"up-left"  \
    }
    function title:new_part
    function title:new_text

    scoreboard players operation panel_id title.io = PlayerNamePanel example.int
    function title:replace_panel

tick函数：

    scoreboard players operation @s title.panel_id = PlayerNamePanel example.int

最终效果：

![显示玩家名](/image/显示玩家名.png)

### 负空格字体

在创建一个新文本部分时，需要与原字体配套的负空格字体

文本库资源包中已有的负空格字体组合：

`default_mod` 与 `default_neg`（原版未开启 “强制使用unicode字体” 时的字体）

`uniform` 与 `uniform_neg`（原版开启 “强制使用unicode字体” 时的字体）

`illageralt` 与 `illageralt_neg`

`alt` 与 `alt_neg`

如果要使用其他字体，需要添加与原字体中对应字符的负空格

其宽度是原字体字符宽度的 -1/2 倍

例如原版字体中 A 的宽度为6，则添加一个宽度为-3的负空格：

    {"providers": [{"type":"space","advances" : { "A": -3 }}]}

