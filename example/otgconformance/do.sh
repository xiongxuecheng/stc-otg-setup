#!/bin/sh

    mkdir -p logs
    log=logs/gotest.log

    CGO_ENABLED=0 go test -v -count=1 -p=1 -timeout 3600s ${@} | tee ${log}

    echo "Summary:"
    grep ": Test" ${log}

    grep FAIL ${log} && return 1 || true

