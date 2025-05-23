#!/bin/bash

# Process the whitelist.txt file
cat base/whitelists/apple.txt | grep -v '^#' | grep -v '^\s*$' | sed 's/^/@@|/' | sed 's/$/^/' | sort | uniq > abp/apple_whitelist_abp.txt

# Create the header and combine with the processed file
(echo "! Title: 🍎 BadBlock - Apple Whitelist (ABP)" && \
    echo "! Version: $(date +'%d%B%Yv1')" && \
    echo "! Expires: 12 hours" && \
    echo "! Description: Unblock the Good! (Apple Edition)" && \
    echo "! Homepage: https://badblock.celenity.dev" && \
    echo "" && \
    cat abp/overrides/apple_whitelist_abp_overrides.txt && \
    cat abp/apple_whitelist_abp.txt) > temp_file && mv -v temp_file abp/apple_whitelist_abp.txt

# Back-up old file
mv -v abp/apple_whitelist.txt abp/old/apple_whitelist_old.txt

# Rename new file
mv -v abp/apple_whitelist_abp.txt abp/apple_whitelist.txt
