#!/usr/bin/env bash

mkdir -p out

URL="https://releases.hashicorp.com/terraform-provider-aws/2.63.0/terraform-provider-aws_2.63.0_linux_amd64.zip"


for i in {01..19}; do
	curl -v -L -o /dev/null ${URL} 2>&1 | tee out/curl-v-${i}.log
	echo $? > out/curl-v-${i}-rc${?}.log
	curl -v -L -I ${URL} 2>&1 | tee out/curl-v-I-${i}.log
	echo $? > out/curl-v-I-${i}-rc${?}.log
done
