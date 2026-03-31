#!/bin/bash

echo "========================================="
echo "       FOSS PACKAGE INSPECTOR"
echo "========================================="
echo ""

PACKAGE="firefox"

echo "Checking if $PACKAGE is installed..."
echo ""

if command -v $PACKAGE &>/dev/null; then
    echo "✓ STATUS: $PACKAGE IS INSTALLED"
    echo ""
    echo "Version Information:"
    firefox --version 2>/dev/null || echo "  Version details available via package manager"
else
    echo "✗ STATUS: $PACKAGE IS NOT INSTALLED"
    echo ""
    echo "To install, run: sudo apt install firefox"
fi

echo ""
echo "========================================="
echo "          LICENSE INFORMATION"
echo "========================================="
echo ""
echo "Firefox uses the Mozilla Public License 2.0 (MPL 2.0)"
echo ""
echo "The Four Freedoms of Free Software:"
echo "  1. Run the program for any purpose"
echo "  2. Study and modify the source code"
echo "  3. Share copies with others"
echo "  4. Share modified versions"
echo ""
echo "========================================="
