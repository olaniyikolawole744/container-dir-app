#!/bin/bash
cd ..
cd packer
ls
packer fmt .
packer init golden_image_ami.pkr.hcl
packer build golden_image_ami.pkr.hcl