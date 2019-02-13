#!/bin/bash -ue
#
# Java 8+ uses PKCS12 keystores. Older JKS keystores can be converted using:
#     keytool -importkeystore -srckeystore keystore.jks -destkeystore keystore.jks -deststoretype pkcs12
#
# File suffix for PKCS12 should be .pfx, else .jks
#

KEY=foo.key
CERT=foo.crt
CERT_ALIAS=foo

CA_CHAIN=ca-chain.crt
CA_CHAIN_ALIAS=ca-chain

KEYSTORE=keystore.pfx
KEYSTORETYPE=PKCS12
PASS=secret

set -x

tmp_pem=$(mktemp)
tmp_pfx=$(mktemp)
cat $KEY $CERT > $tmp_pem

openssl pkcs12 -export \
        -name $CERT_ALIAS \
        -in $tmp_pem \
        -out $tmp_pfx \
        -passout pass:$PASS

rm -f $KEYSTORE

keytool -importkeystore \
        -srcstorepass $PASS \
        -deststorepass $PASS \
        -srckeypass $PASS \
        -destkeypass $PASS \
        -srckeystore $tmp_pfx -srcstoretype $KEYSTORETYPE -alias $CERT_ALIAS \
        -destkeystore $KEYSTORE \
        -deststoretype $KEYSTORETYPE

keytool -import -trustcacerts -noprompt \
        -file $CA_CHAIN \
        -alias $CA_CHAIN_ALIAS \
        -keystore $KEYSTORE \
        -storepass $PASS

keytool -list -keystore $KEYSTORE -storepass $PASS -storetype $KEYSTORETYPE --rfc
keytool -list -keystore $KEYSTORE -storepass $PASS -storetype $KEYSTORETYPE 
