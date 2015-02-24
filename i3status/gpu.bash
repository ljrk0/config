# read line 3 times; we need infinite JSON array for i3status
i3status | (read line && echo $line && read line && echo $line && while :
do
	# read line to modify
	read line
	
	# temperature
	#temp=$(nvidia-smi -q -d TEMPERATURE | grep "GPU Current" | awk '{print $5;}')
	
	# gpuutilization
	gpuutilstats=`nvidia-settings -t -q "$gpuid"/GPUUtilization | tr ',' '\n'`
	gpuusage=`echo "$gpuutilstats"|grep graphics|sed 's/[^0-9]//g'`
	temp="[{ \"full_text\":\"GPU: ${gpuusage}%\"},"
	
	# print
 	echo "${line/[/$temp}" || exit 1
done)
