[prod]
webserver01 ansible_ssh_host=${public_ip[0]}

[test]
webserver02 ansible_ssh_host=${public_ip[1]}

[webserver:children]
prod
test

[webserver:vars]
ansible_ssh_port=22
ansible_ssh_user=ubuntu
ansible_ssh_common_args='-o StrictHostKeyChecking=accept-new'
ansible_ssh_private_key_file="~/.ssh/thomas_perso.pem"