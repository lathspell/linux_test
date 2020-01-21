#!/bin/bash -ue

fqdn=$1
port=${2:-443}

set -v -x
openssl s_client -connect $fqdn:$port </dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text -in -

