#!/bin/bash -eu

declare CONTEXT="kind-kind"

cat apps/*.yaml | kubectl --context="${CONTEXT}" apply -f-
