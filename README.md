This script is used to process a list of IP addresses and create a summary of successful and failed connections for each IP address.

The script does the following:

Creates three output files: success.txt, failure.txt, and output.pcap.
Reads IP addresses from a file called ips.txt, one IP address per line.
For each IP address, it runs the tcpdump command to capture network traffic for that IP address and saves the output to a file called output.pcap.
If the tcpdump command was successful (exit code 0), it writes the IP address to the success.txt file. If it was not successful (exit code non-zero), it writes the IP address to the failure.txt file.
At the end, it deletes the output.pcap file if it is empty. It then prints a summary of the results, including the number of successful and failed connections. Finally, it deletes the success.txt and failure.txt files if they are empty
