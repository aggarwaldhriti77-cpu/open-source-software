#!/bin/bash

echo "========================================="
echo "          LOG FILE ANALYZER"
echo "========================================="
echo ""

LOGFILE="${1:-/var/log/syslog}"
KEYWORD="${2:-error}"

echo "Log file to analyze: $LOGFILE"
echo "Searching for keyword: $KEYWORD"
echo ""

if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File '$LOGFILE' not found!"
    echo ""
    echo "How to use this script:"
    echo "  ./script4.sh [logfile] [keyword]"
    echo ""
    echo "Example:"
    echo "  ./script4.sh /var/log/syslog warning"
    exit 1
fi

COUNT=0
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "========================================="
echo "                RESULTS"
echo "========================================="
echo ""
echo "Total matches found: $COUNT"
echo ""

if [ $COUNT -gt 0 ]; then
    echo "Last 5 matching lines:"
    echo "-----------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
    echo ""
else
    echo "No matches found for '$KEYWORD'"
    echo "Try searching with a different keyword"
    echo ""
fi

echo "========================================="
