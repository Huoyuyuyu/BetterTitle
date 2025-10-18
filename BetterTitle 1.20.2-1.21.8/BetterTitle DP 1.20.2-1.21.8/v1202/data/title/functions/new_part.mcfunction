
# 新部分

data modify entity ad-ad-0-0-1 text set value '{"nbt":"text","storage":"title:io"}'
data modify storage title:io text2 set string entity ad-ad-0-0-1 text 9 -2
data modify entity ad-ad-0-0-1 text set value '{"nbt":"text_buffer","storage":"title:io"}'
data modify storage title:io text_buffer set string entity ad-ad-0-0-1 text 9 -2
data modify entity ad-ad-0-0-1 text set value '{"nbt":"neg_text_buffer","storage":"title:io"}'
data modify storage title:io neg_text_buffer set string entity ad-ad-0-0-1 text 9 -2
data modify entity ad-ad-0-0-1 text set value '""'

function title:code/new_part_macro with storage title:io

