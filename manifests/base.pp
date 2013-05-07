Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


exec { "make-webserver-dir":
    command => "mkdir -p /var/www/html/www.example.com",
}

exec { "grab-epel":
		command => "/bin/rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm",
		creates => "/etc/yum.repos.d/epel.repo",
		alias   => "grab-epel",
}

class {'apache':  
    require => Exec['make-webserver-dir']
}

class {'apache::mod::wsgi': }
class {'apache::mod::php': }

apache::vhost { 'www.example.com':
    priority        => '10',
    vhost_name      => '192.168.33.10',
    port            => '80',
    docroot         => '/var/www/html/www.example.com/docroot/',
    logroot         => '/var/www/html/www.example.com/logroot/',
    serveradmin     => 'webmaster@example.com',
    serveraliases   => ['example.com',],
    options         => 'Indexes FollowSymLinks MultiViews ExecCGI',
}

class { 'mysql::server':
  config_hash => { 'root_password' => 'root' }
}


# Ensure Git is installed
package { "git": ensure => present }

class phpmyadmin {
  package { "phpMyAdmin":
    ensure  => present,
    require => Exec['grab-epel'],
  }

	file { "/etc/httpd/conf.d/phpMyAdmin.conf":
		owner   => "root",
		group   => "root",
		mode    => 644,
		replace => true,
		ensure  => present,
		source  => "/vagrant/files/phpMyAdmin.conf",
		require => Package["httpd"],
		notify  => Service["httpd"],
	
	}
}

include phpmyadmin

