#!/bin/sh

# Địa chỉ API của Google Translate
url="https://translate.googleapis.com/translate_a/single"

# Chuỗi cần dịch
text_to_translate="$@"

# Thực hiện yêu cầu GET bằng wget
response=$(wget -qO- "$url?client=gtx&sl=auto&tl=vi&dt=t&q=$text_to_translate")
#matched_string=$(echo "$response" | grep -oE '(.+)')
array=$(echo "$response" | jq '.[0] | .[0] | .[0]')
# In kết quả
result=$(echo $array | awk '{print substr($0, 2, length-2)}')
echo "Result: $result"
