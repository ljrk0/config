i3status | (read line && echo $line && read line && echo $line && while :
do
	read line
	temp=$(nvidia-smi -q -d TEMPERATURE | grep "GPU Current" | awk '{print $5;}')
	gpuutilstats=`nvidia-settings -t -q "$gpuid"/GPUUtilization | tr ',' '\n'`
	gpuusage=`echo "$gpuutilstats"|grep graphics|sed 's/[^0-9]//g'`
	temp="[{ \"full_text\":\"GPU: ${gpuusage}%\"},"
 	echo "${line/[/$temp}" || exit 1
done)
