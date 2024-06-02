# shellcheck shell=bash
# Prints the CPU usage: user% sys% idle.
normalize_percent_len() {
  # the max length that the percent can reach, which happens for a two digit number with a decimal house: "99.9%"
  max_len=5
  percent_len=${#1}
  let diff_len=$max_len-$percent_len
  # if the diff_len is even, left will have 1 more space than right
  let left_spaces=($diff_len+1)/2
  let right_spaces=($diff_len)/2
  printf "%${left_spaces}s%s%${right_spaces}s\n" "" $1 ""
}

get_percent()
{
  case $(uname -s) in
    Darwin)
      cpuvalue=$(ps -A -o %cpu | awk -F. '{s+=$1} END {print s}')
      cpucores=$(sysctl -n hw.logicalcpu)
      # cpuusage=$(( cpuvalue / cpucores ))
      cpuusage=$(echo "scale=1; $cpuvalue / $cpucores" | bc)
      percent="$cpuusage%"
      normalize_percent_len $percent
      ;;
  esac
}

run_segment() {
	if shell_is_linux; then
		cpu_line=$(top -b -n 1 | grep "Cpu(s)")
		cpu_user=$(echo "$cpu_line" | grep -Po "(\d+(.\d+)?)(?=%?\s?(us(er)?))")
		cpu_system=$(echo "$cpu_line" | grep -Po "(\d+(.\d+)?)(?=%?\s?(sys?))")
		cpu_idle=$(echo "$cpu_line" | grep -Po "(\d+(.\d+)?)(?=%?\s?(id(le)?))")
	elif shell_is_osx; then
		cpus_line=$(top -e -l 1 | grep "CPU usage:" | sed 's/CPU usage: //')
		cpu_user=$(echo "$cpus_line" | awk '{print $1}' | sed 's/%//')
		cpu_system=$(echo "$cpus_line" | awk '{print $3}' | sed 's/%//')
		cpu_idle=$(echo "$cpus_line" | awk '{print $5}' | sed 's/%//')
        
        cpuvalue=$(ps -A -o %cpu | awk -F. '{s+=$1} END {print s}')
      cpucores=$(sysctl -n hw.logicalcpu)
      cpuusage=$(( cpuvalue / cpucores ))
      percent="$cpuusage%"
	fi

    cpu_usage=$(echo "scale=1; 100 - $cpu_idle" | bc)
    cpu_percent=$(get_percent)

	if [ -n "$cpu_user" ] && [ -n "$cpu_system" ] && [ -n "$cpu_idle" ]; then
		# printf "${cpu_user} ${cpu_system} ${cpu_idle} ${cpu_percent}"
		printf "${cpu_percent}"
		return 0
	else
		return 1
	fi
}
