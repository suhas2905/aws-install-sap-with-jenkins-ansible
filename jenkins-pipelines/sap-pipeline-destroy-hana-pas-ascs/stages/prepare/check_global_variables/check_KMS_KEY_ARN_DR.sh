#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Check if the variable is present. If not, send back default value
# ------------------------------------------------------------------
if [ -z "$KMS_KEY_ARN_DR" ]; then
    echo "Invalid KMS Key ARN DR. It cannot be empty. Go to https://console.aws.amazon.com/kms/home?region=us-east-2#/kms/keys and use a valid Key ARN"
    exit 100
fi

echo "$KMS_KEY_ARN_DR"

exit 0
