#!/bin/bash
cd ..
cd packer
docker-compose -f docker-compose.yml run --rm packer build golden_image_ami222.pkr.hcl