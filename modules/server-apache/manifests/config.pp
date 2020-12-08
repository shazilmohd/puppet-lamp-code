# == Class: server-apache::config
class server-apache::config inherits server-apache {

 file { '/etc/apache2/mods-enabled/userdir.load':
                ensure => 'link',
                target => '/etc/apache2/mods-available/userdir.load',
                notify => Service["apache2"],
                require => Package["apache2"],
        }

        file { '/etc/apache2/mods-enabled/userdir.conf':
                ensure => 'link',
                target => '/etc/apache2/mods-available/userdir.conf',
                notify => Service["apache2"],
                require => Package["apache2"],
        }
 file {'/etc/apache2/mods-available/php5.conf':
		ensure => 'present',  
             content => template("/home/master/example/vhost.erb"),
              require => Package["apache2"],
             notify => Service["apache2"],
    }

      file { "/etc/apache2/sites-available/000-default.conf":
   ensure => "present",
   content => template("/etc/puppet/modules/server-apache/templates/vhost.erb"),
   notify => Service['apache2'],
   require => Package['apache2']
}
  file    { "/var/www/html/example":
        ensure => "present",
        source => ['puppet:///modules/server-apache/'],
	 recurse => "true",
        owner => "root",
        group => "root",
        mode => "755",
         }

}

























