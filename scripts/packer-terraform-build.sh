#!/bin/bash
set -x

cd ./packer-config
./packer build ami.json
cd ../terraform-config
./terraform plan
./terraform apply -auto-approve
