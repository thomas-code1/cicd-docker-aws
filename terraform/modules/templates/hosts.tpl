[production]
webserver01 ansible_ssh_host=${public_ip[0]}

[dev]
webserver02 ansible_ssh_host=${public_ip[1]}

[webserver:children]
production
dev

[webserver:vars]
ansible_ssh_port=22
ansible_ssh_user=ubuntu
ansible_ssh_common_args='-o StrictHostKeyChecking=accept-new'
ansible_ssh_private_key_file="~/.ssh/thomas_perso.pem"