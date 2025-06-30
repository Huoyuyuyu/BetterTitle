
# 新部分

data modify storage title:io text_buffer append value {text:"", font:"", extra:[]}
data modify storage title:io text_buffer[-1].extra append from storage title:io text
data modify storage title:io text_buffer[-1].font set from storage title:io font

data modify storage title:io neg_text_buffer append value {text:"", font:"",extra:[]}
data modify storage title:io neg_text_buffer[-1].extra append from storage title:io text
data modify storage title:io neg_text_buffer[-1].font set from storage title:io neg_font

