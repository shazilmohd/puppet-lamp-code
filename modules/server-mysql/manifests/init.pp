# == Class: mysql
#
# Full description of class mysql here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'mysql':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#

class server-mysql { 
 class { '::mysql::server':

root_password => 'qburst',
override_options => { 
        mysqld => { bind-address => '0.0.0.0'} #Allow remote connections
      },

}




# Rebuild the database, but only when the file changes
#exec { dbscript:
#  path        => ['/usr/bin', '/usr/sbin'],
#  subscribe   => File['/var/www/html/mysql/db.sh'],
#  refreshonly => true,
#}

exec { "create-db":
    unless => "/usr/bin/mysql -uroot -pqburst ",
    command => "/usr/bin/mysql -uroot -pqburst -e \"create database shazil; use shazil; CREATE TABLE IF NOT EXISTS users (id int(11) NOT NULL AUTO_INCREMENT,username VARCHAR(50) NOT NULL, email VARCHAR(50) NOT NULL,password varchar(50) NOT NULL,trn_date datetime NOT NULL,PRIMARY KEY (id)); grant all on *.* to 'root'@'localhost' identified by 'qburst'; flush privileges;\"",
      require => Service["mysqld"],
    }
  


}
