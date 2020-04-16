# Removing spaces, slashs and newlines
labels_json=$(echo "${1}" | sed 's/\\//g' | tr -d '\n' |tr -d ' ')

for row in $(echo "${labels_json}" | jq -c '.[]'); do
    _jq() {
     echo ${row} | jq -c ${1}
    }
   echo $(_jq '.name')
done


