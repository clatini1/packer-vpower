#!/bin/bash
set -x

cd ./packer-config
./packer build ami.json
cd ../terraform-config
./terraform plan
./terraform apply -auto-approve
git add terraform.tfstate
git commit -m "terraform.tfstate"
git push origin HEAD:master
