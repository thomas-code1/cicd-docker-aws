[webserver]
webserver ansible_ssh_host=${ip}

[webserver:vars]
ansible_ssh_port=22
ansible_ssh_user=ubuntu
ansible_ssh_common_args='-o StrictHostKeyChecking=accept-new'
ansible_ssh_private_key_file="~/.ssh/thomas_perso.pem"