- Must have an EC2 already up and running and enter its IP address (public IP) in inventory.ini
- I like to go into container first and show them how things are volume bind mounted by navigating container file system ..
```
docker run --rm -it \
  -v "$PWD":/runner \
  -v ~/.ssh/WebTier-EC2-London-KeyPair.pem:/runner/WebTier-EC2-London-KeyPair.pem:ro \
  quay.io/ansible/ansible-runner \
  sh
```
- can run test inside container to show that can connect
```
ansible app_servers -m ping -i inventory.ini
```

- Then exit container and actually run script that executes playbook inside the container
```
./01-run-ansible-container.sh
```
