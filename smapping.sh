#!/bin/bash

# Create a temporary file to store the targets
targets_file=$(mktemp)

# Iterate over each program
for p in $(bbrf programs); do
  # Retrieve the list of IP addresses for the program
  bbrf ips -p $p > $targets_file

  # Run smap tool with the IP addresses as targets
  echo "🌐 Running smap tool for program $p..."
  smap -iL $targets_file -oP smap_output.txt

  # Set the current program in bbrf
  echo "📝 Setting current program to $p..."
  bbrf use $p

  # Add services from smap_output.txt to the current program
  echo "📥 Adding services from smap_output.txt to $p..."
  cat smap_output.txt | bbrf service add -

  echo "✅ Completed processing for program $p."
  echo
done

# Remove the temporary targets file
rm $targets_file
