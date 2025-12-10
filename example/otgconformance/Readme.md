# These are the testcases under platform open-traffic-generator/conformance

# Steps to run the testcases
## 1. Get conformance build and run environment
./generate.sh  
Repository conformance was cloned with a specific commit  
conformance/test-config.yaml created as a soft link to the target ./test-config.yaml  

## 2. Edit the test-config.yaml

## 3. Run the test
./do.sh stcfeature/b2b/ospfv2/ospfv2_p2p_lsa_test.go  
./do.sh stcfeature/b2b/ospfv2/ospfv2_p2p_lsa_test.go -test.run TestOspfv2P2pLsa  
