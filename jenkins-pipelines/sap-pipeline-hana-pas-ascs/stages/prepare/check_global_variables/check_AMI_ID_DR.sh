#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Check if the variable is present. If not, send back default value
# ------------------------------------------------------------------
if [ -z "$AMI_ID_DR" ]; then
    echo "Invalid AMI ID_DR. Check your AMI Id of DR on AWS Marketplace > RHEL 8.2"
    exit 100
fi

echo "$AMI_ID_DR"
exit 0
