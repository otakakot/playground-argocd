#!/bin/bash -eu

declare CONTEXT="kind-kind"

cat app/*.yaml | kubectl --context="${CONTEXT}" apply -f-
