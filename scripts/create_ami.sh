#!/bin/bash
cd ..
cd packer
packer fmt .
packer init golden_image_ami222.pkr.hcl
packer build golden_image_ami222.pkr.hcl
