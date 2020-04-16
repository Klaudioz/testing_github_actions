sample='[{"name":"foo"},{"name":"bar"}]'
for row in $(echo "${sample}" | jq -c '.[]'); do
    _jq() {
     echo ${row} | jq -c ${1}
    }

   echo $(_jq '.name')
done
