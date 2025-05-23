#!/bin/bash

# Process the drm.txt file
cat base/drm.txt | grep -v '^#' | grep -v '^\s*$' | sort | uniq > wildcards-no-star/drm_no_star.txt

# Create the header and combine with the processed file
(echo "# Title: 🔒 BadBlock - DRM (Wildcards no *)" && \
    echo "# Version: $(date +'%d%B%Yv1')" && \
    echo "# Expires: 12 hours" && \
    echo "# Description: Stop Digital Restrictions Management!" && \
    echo "# Homepage: https://badblock.celenity.dev" && \
    echo "" && \
    cat wildcards-no-star/drm_no_star.txt) > temp_file && mv -v temp_file wildcards-no-star/drm_no_star.txt

# Back-up old file
mv -v wildcards-no-star/drm.txt wildcards-no-star/old/drm_old.txt

# Rename new file
mv -v wildcards-no-star/drm_no_star.txt wildcards-no-star/drm.txt
