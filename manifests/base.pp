Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


exec { "make_webserver_dir":
    command => "mkdir -p /var/www/html/www.example.com",
}

class {'apache::mod::wsgi':
      require => Exec['make_webserver_dir']
 }

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




