#!/bin/bash

# Check if a log direcory is provided or not
if [ -z "$1" ]; then
	echo "Usage: log-arch.sh <location>"
	exit 1
fi

#variables
Log_dir="$1"
Arch_dir="archived_logs"
Timestamp=$(date + "%d%m%y_%HH%MM%SS")
Arch_name="log_arch_$Timestamp.tar.gz"
log_file="archive_log.txt"

#Create the archive dir, if it does not exist.
if [ ! -d "$Arch_dir"]; then
	mkdir "$Arch_dir"
fi

#compress
tar -czvf "$Arch_dir/$Arch_name" -c "$Log_dir" .

#Log the date & time of the archive
echo [$(date + %d-%m-%Y %H:%M:%S)] Archived $Log_dir to $Arch_dir/$Arch_name >> "$Arch_dir/$log_file"

echo "Logs archived successfully: $Arch_dir/$Arch_name"
