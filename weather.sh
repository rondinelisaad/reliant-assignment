#/bin/bash
# Author: Rondineli Saad
# Description: This script will requesting weather information from api HG Brasil. Every each minute one request
# will be send and one file in json format will be save with a timestamp in the name. Sample: weather_1648498931.json.
# If you want to get a different city code you have to login on https://console.hgbrasil.com/
# Version: 0.1
# Dependencies: jq and curl command 

joao_pessoa_hgcode="455872"
city="João Pessoa"
hg_weather="https://api.hgbrasil.com/weather?woeid=${joao_pessoa_hgcode}"


while true; do
timestamp=$(date +%s)
if curl -s --head  --request GET ${hg_weather} | grep "HTTP/2 200" > /dev/null; then 
	current_weather=`curl "${hg_weather}" | jq .results.temp`

json_data=$(cat <<EOF 
{
	"name": "forecast",
	"city": "${city}",
	"temp": "${current_weather}"
}
EOF
)

echo "${json_data}" > weather_${timestamp}.json

else
   echo "API HG Brasil is DOWN" > weather_${timestamp}.json
fi

sleep 60
done

