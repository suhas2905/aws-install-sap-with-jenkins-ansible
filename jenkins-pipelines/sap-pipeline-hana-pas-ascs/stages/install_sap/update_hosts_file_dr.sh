#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Grab data from Terraform
# ------------------------------------------------------------------
if [ -z "$ANSIBLE_DIR" ]; then
    echo "No Ansible playbook dir was found as reference. Please check again"
    exit 100
fi

if [ -z "$SSH_KEYPAIR_FILE_DR_CHKD" ]; then
    echo "No KeyPair file param was found. Please check again"
    exit 100
fi

if [ -z "$HOSTS_IPS_DR" ]; then
    echo "No Hosts IPs were received as input params"
    exit 100
fi


private_ips_values=$(echo $HOSTS_IPS_DR | sed "s/\[/\ /g" | sed "s/\]/\ /g" | sed "s/\,/\ /g")
eval "private_ips_array=($private_ips_values)"

HANA_PRIMARY_PRIVATE_IP=${private_ips_array[0]}

# ------------------------------------------------------------------
# Create hosts_runtime.yml
# ------------------------------------------------------------------
cp "$ANSIBLE_DIR/hosts.yaml" "$ANSIBLE_DIR/hosts_runtime.yaml"
hostsFile="$ANSIBLE_DIR/hosts_runtime.yaml"

sed -i "s/HANA_PRIM_HOST_NAME_TO_APPLY/$HANA_PRIMARY_PRIVATE_IP/g" $hostsFile
sed -i "s|PATH_TO_PEM_FILE|$SSH_KEYPAIR_FILE_DR_CHKD|g" $hostsFile

exit 0
