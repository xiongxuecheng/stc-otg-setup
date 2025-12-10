# Getting Started: Ondatra Feature Profiles Testing on TestCenter

This guide demonstrates how to run Ondatra-based featureprofile tests using STC and Arista cEOS.

## Example Test Case
`featureprofiles/feature/interface/staticarp/otg_tests/static_arp_test`

---

## 1. Setup Testbed

### Deploy Lab Infrastructure

1. **Deploy Labserver(Docker) and otgService**
    > Configure otgService resetserver to use the Labserver IP address
   
2. **Deploy STC and Arista DUT using Containerlab**
    #### ***Load Docker Images***
   ```bash
   docker load -i stc_5.51.2946.tgz
   docker import cEOS64-lab-4.35.0F.tar.xz ceos-lab-4.35.0f:latest
   ```

    #### ***Deploy Containerlab Topology***
   ```bash
   containerlab deploy -t stcv-arista-demo-5.51.yaml
   ```
   > **Note:** Requires containerlab version 0.71.1 or later
   Note： require labserver and containerlab env located in same host

---

## 2. Prepare Test Case

### Generate featureprofile test library from Upstream
Follow the [stc-otg-setup generation guide](https://github.com/Spirent-STC/stc-otg-setup/blob/main/example/ondatra/generate.sh) to sync test cases from upstream featureprofiles.

### Build Directly
```bash
cd featureprofiles/feature/interface/staticarp/otg_tests/static_arp_test
go test -c
```

---

## 3. Configure Test Environment

Copy testbed and binding configuration files to the test directory:

```bash
mv ./dut.testbed featureprofiles/feature/interface/staticarp/otg_tests/static_arp_test/
mv ./dut.binding featureprofiles/feature/interface/staticarp/otg_tests/static_arp_test/
```

Update the files with your actual testbed IP addresses and device mappings.

---

## 4. Execute Test

Run the test with testbed and binding configuration:

```bash
cd featureprofiles/feature/interface/staticarp/otg_tests/static_arp_test
./static_arp_test.test -testbed dut.testbed -binding dut.binding -test TestStaticARP -v
```

### Command Options
- `-testbed` - Path to testbed YAML file
- `-binding` - Path to binding YAML file  
- `-test` - Test name pattern to run
- `-v` - Verbose output

---

## Troubleshooting

- Ensure containerlab and Docker are properly installed
- Verify network connectivity between Labserver, STC, and DUT
- Check testbed/binding files match your actual topology
- Use `-v` flag for detailed test output