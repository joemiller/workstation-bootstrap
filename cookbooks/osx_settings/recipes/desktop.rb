# set suspend mode to RAM only and delete the sleepimage to save space on the SSD
execute "sudo pmset -a hibernatemode 0"
execute "sudo rm /private/var/vm/sleepimage"
