#!/bin/bash
cd ..
cd packer
packer fmt .
packer init golden_image_ami.pkr.hcl
packer build golden_image_ami.pkr.hcl
