package {'php':
  ensure => present,
  before => File['/etc/php.ini'],
}

file {'/etc/php.ini':
  ensure => file,
}

package {'httpd':
  ensure => present,
}

service { 'httpd':
  ensure => running,
  enable => true,
  require => Package['httpd'],
  subscribe => File['/etc/php.ini'],
}

package {'epel':
  ensure => present,
  source => "http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm",
  provider => rpm,
}

package {'mysql-server':
  ensure => present,
  require => Package['epel'],
}

service { 'mysqld':
  ensure => running,
  enable => true,
  require => Package['mysql-server'],
}


