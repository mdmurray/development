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
# Copyright 2015 Your name here, unless otherwise noted.
#
class mysql (
  $group		= 'mysql',
  $service_enabled	= true,
  $service_running	= true,
  $user			= 'mysql'
){
  class { 'mysql::install':
    user 	=> $user,
    group 	=> $group,
  }
  class { 'mysql::config':
    user 	=> $user,
    group 	=> $group,
  }
  class { 'mysql::service':
    ensure 	=> $service_running,
    enabled 	=> $service_enabled,
  }
}

testing 123
