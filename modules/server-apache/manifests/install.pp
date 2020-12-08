# == Class: server-apache::install
class server-apache::install inherits server-apache {
 package {'apache2':
                ensure => present,
        }
#  package {'libapache2-mod-php5':
 #               ensure => present,
 #       }
  package {'php5':
                ensure => present,
        }
 package {'php5-curl':
                ensure => present,
        }

 package {'php5-mysql':
                ensure => present,
        }



}
