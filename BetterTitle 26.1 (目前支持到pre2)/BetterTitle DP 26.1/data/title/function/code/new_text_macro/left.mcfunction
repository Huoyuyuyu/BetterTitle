
$data modify storage title:io panel_buffer append value {text: "\u$(tempx)", font: "title:x_displace"}
$data modify storage title:io panel_buffer append value {text: "\u$(tempy)", font: "title:y_displace"}
$data modify storage title:io panel_buffer append value {text: "$(o)", font: "title:o_displace"}

data modify storage title:io panel_buffer append from storage title:io text_buffer
data modify storage title:io panel_buffer append from storage title:io neg_text_buffer
data modify storage title:io panel_buffer append from storage title:io neg_text_buffer

$data modify storage title:io panel_buffer append value {text: "\u$(tempx)", font: "title:x_displace_neg"}
$data modify storage title:io panel_buffer append value {text: "\u$(tempy)", font: "title:y_displace_neg"}
$data modify storage title:io panel_buffer append value {text: "$(o)", font: "title:o_displace_neg"}

