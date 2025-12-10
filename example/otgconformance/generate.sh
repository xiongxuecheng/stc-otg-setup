#!/usr/bin/bash

# Clone specific commit of https://github.com/open-traffic-generator/conformance.git

COMMIT=baaf162badcc40a4893f2d9fe2c2a3b6d1f148fb

git clone https://github.com/open-traffic-generator/conformance.git

cd conformance

git checkout $COMMIT

# create soft link test-config.yaml
ln -s ../test-config.yaml test-config.yaml

cd -

#done!
