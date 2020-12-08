# == Class: server-apache::service
class server-apache::service inherits server-apache {
  service {'apache2':
                ensure => "running",
                enable => "true",
                restart         => "/usr/sbin/apachectl configtest && /etc/init.d/apache2 reload",
           require => Package["apache2"],
        }


}


