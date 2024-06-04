vagrant up
ssh-keyscan -H 192.168.56.50 >> ~/.ssh/known_hosts
ansible-playbook ./ansible/playbook.yml -i ./ansible/hosts.ini
