## Requirements

- bbrf: The bbrf framework is required for retrieving program and IP address information.
- smap: Smap is a port scanner built with shodan.io's free API. It takes same command line arguments as Nmap and produces the same output which makes it a drop-in replacament for Nmap.

## Usage

1. Clone the repository: `git clone https://github.com/bebiksior/bbrf-smapping.git`
2. Navigate to the project directory: `cd bbrf-smap`
3. Run the script: `./smapping.sh`

The script will iterate over each program in bbrf, retrieve the IP addresses, run the smap tool to gather port and service information, and add the discovered services to the corresponding program.
