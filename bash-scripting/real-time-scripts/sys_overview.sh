#Write a bash script which lists the CPU, Memory and Disk Usages in `Used / Total` format. Afterwards lists down top 5 
#CPU and Memory intensive processes.

#!/bin/bash
#-b → runs top in batch mode (plain text output, good for scripts).
#-n1 → show 1 iteration (one snapshot) and then exit.
# echo with no argument is used to ensure a blank newline between two consecutive lines in bash outputs.
echo "===Start of System Resource Usage Overview==="
echo
echo "+++ CPU Used% vs Total% +++"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Used: " 100 - $8 "% / Total: 100%"}'
echo
echo "+++ MEM Used% vs Total% +++"
top -bn1 | grep "MiB Mem"    | awk '{print "Memory Used: "$6"MB / Total: "$4"MB" }'
echo
echo "+++ DISK Used vs Total +++"
df -ah --total|grep -i total|awk '{print "Disk Used: "$3"/ Total: "$2}'
echo
echo "+++ Top 5 CPU Intensive Processes +++"
echo
ps --sort=-%mem | head -n5
echo
echo "+++ Top 5 MEM Intensive Processes +++"
echo
ps --sort=-%cpu | head
echo
echo "===End of System Resource Usage Overview==="