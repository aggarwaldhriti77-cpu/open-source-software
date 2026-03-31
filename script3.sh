#!/bin/bash

echo "========================================="
echo "     DISK AND PERMISSION AUDITOR"
echo "========================================="
echo ""

echo "Analyzing important system directories..."
echo ""

printf "%-20s %-25s %-12s\n" "DIRECTORY" "OWNER:GROUP" "SIZE"
echo "--------------------------------------------------------------"

for DIR in /etc /var/log /home /usr/bin /tmp; do
    if [ -d "$DIR" ]; then
        OWNER=$(ls -ld "$DIR" | awk '{print $3":"$4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-20s %-25s %-12s\n" "$DIR" "$OWNER" "$SIZE"
    else
        printf "%-20s %-25s %-12s\n" "$DIR" "NOT FOUND" "-"
    fi
done

echo ""
echo "========================================="
echo "     FIREFOX CONFIGURATION CHECK"
echo "========================================="
echo ""

FIREFOX_DIR="$HOME/.mozilla/firefox"

if [ -d "$FIREFOX_DIR" ]; then
    echo "✓ Firefox configuration found at: $FIREFOX_DIR"
    PERMS=$(ls -ld "$FIREFOX_DIR" | awk '{print $1, $3, $4}')
    echo "  Permissions: $PERMS"
else
    echo "• Firefox configuration not found"
    echo "  (Firefox may not be installed or never launched)"
fi

echo ""
echo "========================================="
