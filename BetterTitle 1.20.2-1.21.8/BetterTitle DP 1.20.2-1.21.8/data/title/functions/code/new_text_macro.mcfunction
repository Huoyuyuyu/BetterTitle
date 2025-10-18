
$execute store result storage title:io o int 1.0 run function title:code/origin/$(origin)

data modify entity ad-ad-0-0-1 text set value '{"nbt":"panel_buffer","storage":"title:io"}'
data modify storage title:io panel_buffer set string entity ad-ad-0-0-1 text 1 -1
data modify entity ad-ad-0-0-1 text set value '{"nbt":"text_buffer","storage":"title:io"}'
data modify storage title:io text_buffer set string entity ad-ad-0-0-1 text 1 -1
data modify entity ad-ad-0-0-1 text set value '{"nbt":"neg_text_buffer","storage":"title:io"}'
data modify storage title:io neg_text_buffer set string entity ad-ad-0-0-1 text 1 -1
data modify entity ad-ad-0-0-1 text set value '""'

$function title:code/new_text_macro/$(align) with storage title:io

data modify storage title:io text_buffer set value '""'
data modify storage title:io neg_text_buffer set value '""'

