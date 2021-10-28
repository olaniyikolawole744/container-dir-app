#!/bin/bash
cd ..
cd packer || exit
packer fmt .
packer init golden_image_ami.pkr.hcl
packer build golden_image_ami.pkr.hcl
