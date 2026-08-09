#!/bin/sh

docker run --rm -it \
  -v "$PWD":/runner \
  -v ~/.ssh/WebTier-EC2-London-KeyPair.pem:/runner/WebTier-EC2-London-KeyPair.pem:ro \
  quay.io/ansible/ansible-runner \
  ansible-playbook -i /runner/inventory.ini /runner/playbook.yml
