#!/bin/bash

# finds out what the max frequency is
MAX_FREQ=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq) || (echo Required sys files not found; exit 1)

# finds out what the min frequency is
MIN_FREQ=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq) || (echo Required sys files not found; exit 1)

# Governors are the power profiles which are handled by the intel pstate technology - you can find out which profiles you have with the command below
# echo "Available governors: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)" || (echo Required sys files not found; exit 1)

# finds out how many CPUs we have - we have to substract 1 because it starts counting from CPU0
CPU_NUMBER=$(($(ls -1r /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_max_freq|wc -l)-1)) || (echo Required sys files not found; exit 1)

# Do we have cpufreq-info so we can show the profile at the end?
[ -x "$(command -v cpufreq-info)" ] || (echo cpufreq-info not installed - cannot continue; exit 1)

# Check command line parameters
if [ "$1" == "ps" ];then
   echo Using Powersave profile
   HIGH_FREQ=$MAX_FREQ
   LOW_FREQ=$MIN_FREQ
   GOVERNOR="powersave"
   DISABLEPSTATETURBO="1"
elif [ "$1" == "pf" ]
then
   echo Using Performance profile
   HIGH_FREQ=$MAX_FREQ
   LOW_FREQ=$MIN_FREQ
   GOVERNOR="performance"
   DISABLEPSTATETURBO="0"

elif [ "$1" == "psx" ]
then
   echo Using Powersave Extreme profile
   HIGH_FREQ=$MIN_FREQ
   LOW_FREQ=$MIN_FREQ
   GOVERNOR="powersave"
   DISABLEPSTATETURBO="1"

else
   echo -e "Unknown parameter - Available parameters are:\n    $0 ps  -> powersave\n    $0 psx -> powersave extreme\n    $0 pf  -> performance"; exit 1
fi

# we need sudo to write to the driver, that's why I use tee. I couldn't use a wildcard for this - feel free to upgrade this :)
for cpu in $(seq 0 $CPU_NUMBER); do
  echo $DISABLEPSTATETURBO | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null
  echo $LOW_FREQ | sudo tee /sys/devices/system/cpu/cpu${cpu}/cpufreq/scaling_min_freq >/dev/null
  echo $HIGH_FREQ | sudo tee /sys/devices/system/cpu/cpu${cpu}/cpufreq/scaling_max_freq >/dev/null
  echo $LOW_FREQ | sudo tee /sys/devices/system/cpu/cpufreq/policy${cpu}/scaling_min_freq >/dev/null
  echo $HIGH_FREQ | sudo tee /sys/devices/system/cpu/cpufreq/policy${cpu}/scaling_max_freq >/dev/null
  echo $GOVERNOR | sudo tee /sys/devices/system/cpu/cpufreq/policy${cpu}/scaling_governor >/dev/null
  echo $GOVERNOR | sudo tee /sys/devices/system/cpu/cpu${cpu}/cpufreq/scaling_governor>/dev/null
done

# Shows the updated power profile
sudo cpufreq-info

# More reference on this @ https://wiki.archlinux.org/index.php/CPU_frequency_scaling
# Author: Rodrigo H. Marras
# email: rodri@marras.com.ar

