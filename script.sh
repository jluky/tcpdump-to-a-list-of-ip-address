#!/bin/bash

# create output files
success_file="success.txt"
failure_file="failure.txt"
output_file="output.pcap"

# empty the output files if they already exist
: > "$success_file"
: > "$failure_file"

# read IP addresses from file
while read -r ip; do
    # run tcpdump for the current IP address
    # and save the output to a single file
    sudo tcpdump -i eth0 host "$ip" -w "$output_file"

    # check if there were any successful connections
    if [ $? -eq 0 ]; then
        # if there were, write the IP address to the success file
        echo "$ip" >> "$success_file"
    else
        # if there weren't, write the IP address to the failure file
        echo "$ip" >> "$failure_file"
    fi
done < "ips.txt"

# delete the output file if it is empty
if [ ! -s "$output_file" ]; then
    rm "$output_file"
fi

# print a summary of the results
echo "Finished processing IP addresses"
echo "Successful connections: $(cat "$success_file" | wc -l)"
echo "Failed connections: $(cat "$failure_file" | wc -l)"

# delete the output files if they are empty
if [ ! -s "$success_file" ]; then
    rm "$success_file"
fi
if [ ! -s "$failure_file" ]; then
    rm "$failure_file"
fi
