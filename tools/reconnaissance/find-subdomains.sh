#!/usr/bin/env bash

set -euo pipefail

usage() {
  echo "Usage: bash find-subdomains.sh <domain>"
  echo "Example: bash find-subdomains.sh example.com"
}

if [[ $# -ne 1 ]]; then
  usage >&2
  exit 1
fi

domain="${1,,}"

if [[ ${#domain} -gt 253 ]]; then
  echo "Error: Domain name is too long." >&2
  exit 1
fi

IFS='.' read -ra labels <<< "$domain"
if [[ ${#labels[@]} -lt 2 ]]; then
  echo "Error: Enter a fully qualified domain such as example.com." >&2
  exit 1
fi

for label in "${labels[@]}"; do
  if [[ ${#label} -lt 1 || ${#label} -gt 63 || ! "$label" =~ ^[a-z0-9]([a-z0-9-]*[a-z0-9])?$ ]]; then
    echo "Error: Invalid domain name." >&2
    exit 1
  fi
done

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

if command -v subfinder >/dev/null 2>&1; then
  subfinder_command=$(command -v subfinder)
elif command -v subfinder.exe >/dev/null 2>&1; then
  subfinder_command=$(command -v subfinder.exe)
elif [[ -f "$script_dir/tools/subfinder.exe" ]]; then
  subfinder_command="$script_dir/tools/subfinder.exe"
else
  echo "Error: subfinder is not installed or is not in PATH." >&2
  echo "Install it from: https://github.com/projectdiscovery/subfinder/releases" >&2
  exit 1
fi

output_dir="$script_dir/results"
output_file="$output_dir/${domain}-subdomains.txt"
temporary_file=$(mktemp)
trap 'rm -f "$temporary_file"' EXIT

mkdir -p "$output_dir"

echo "Finding subdomains for $domain..."
if ! "$subfinder_command" -all -silent -d "$domain" > "$temporary_file"; then
  echo "Error: subfinder failed to complete the scan." >&2
  exit 1
fi

awk -v domain="$domain" '
  {
    candidate = tolower($0)
    sub(/\r$/, "", candidate)
    sub(/\.$/, "", candidate)
    suffix = "." domain
    if (candidate == domain ||
        (length(candidate) > length(domain) &&
         substr(candidate, length(candidate) - length(domain), length(domain) + 1) == suffix)) {
      print candidate
    }
  }
' "$temporary_file" > "$output_file"

if ! grep -Fxq "$domain" "$output_file"; then
  echo "$domain" >> "$output_file"
fi

sort -u "$output_file" -o "$output_file"
count=$(wc -l < "$output_file" | tr -d ' ')

echo "Found $count unique domain(s)."
echo "Results: $output_file"
