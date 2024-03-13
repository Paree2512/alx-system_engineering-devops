# Exec resource to replace the 'nofile' limit to 50,000 in the '/etc/security/limits.conf' file
exec {'replace_nofile_1':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf',
  before   => Exec['replace_nofile_2'], # Ensure this command runs before replacing the second 'nofile' limit
}

# Exec resource to replace the 'nofile' limit to 40,000 in the '/etc/security/limits.conf' file
exec {'replace_nofile_2':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 4/nofile 40000/" /etc/security/limits.conf',
}
