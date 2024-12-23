
$data modify storage title:io panel_buffer set value "{\"text\":\"\",\"extra\": [  \
    $(panel_buffer),\
    {\"text\":\"\\u$(tempx)\",\"font\":\"title:x_displace\"},  \
    {\"text\":\"\\u$(tempy)\",\"font\":\"title:y_displace\"},  \
    {\"text\":\"$(o)\",\"font\":\"title:o_displace\"},  \
    $(neg_text_buffer),$(neg_text_buffer),$(text_buffer),  \
    {\"text\":\"\\u$(tempx)\",\"font\":\"title:x_displace_neg\"},  \
    {\"text\":\"\\u$(tempy)\",\"font\":\"title:y_displace_neg\"},  \
    {\"text\":\"$(o)\",\"font\":\"title:o_displace_neg\"}  \
]}"
