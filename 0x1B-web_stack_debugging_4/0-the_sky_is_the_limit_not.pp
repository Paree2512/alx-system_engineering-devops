# Exec resource to replace the ULIMIT value in the Nginx configuration file
exec {'replace_ulimit':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => Exec['restart_nginx'], # Ensure this command runs before restarting Nginx
}

# Exec resource to restart the Nginx service
exec {'restart_nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
