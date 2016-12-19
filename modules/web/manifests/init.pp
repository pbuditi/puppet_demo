class web {

	package {'httpd':
		ensure => present,
	}
	
	file { 'index_file':
		path => "/var/www/html/index.html",
		source => "puppet:///modules/web/index.html",
	}
	
	service { 'httpd':
		ensure => running,
		enable => true,
		require => Package['httpd'],
	}

}
