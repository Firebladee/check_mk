# Document me

define check_mk::agent (
#  $check_mk_tags,
  $check_mk_tags  = '',
  $check_mk_alias = '',

  $omd_site_home           = "/opt/omd/sites/${name}",
  $check_mk_location       = '/etc/check_mk',
#  $check_mk_agent_location = "${check_mk_location}/agents",
  $check_mk_agent          = 'check_mk-agent-1.2.2p3-1.noarch.rpm',

){

  #TODO: Add details for different os
  case $::osfamily {
    RedHat:{
      file { "/tmp/${check_mk_agent}":
        ensure => present,
        path   => "/tmp/${check_mk_agent}",
        source => "puppet:///modules/check_mk/${check_mk_agent}",
      }
      package { 'xinetd': ensure => latest}

      exec { "rpm -i /tmp/${check_mk_agent}":
        cwd     => '/tmp',
        creates => '/usr/bin/check_mk_agent',
        require => [File["/tmp/${check_mk_agent}"],Package['xinetd']],
      }
    }
    Debian:{ package { 'check-mk-agent': ensure => latest}}
    default: {notify{'OS not support for check_mk agent':}}
  }

  @@file {
    "${omd_site_home}/${check_mk_location}/conf.d/main/${::hostname}.mk":
      ensure  => file,
      content => template('check_mk/main.erb'),
      tag     => 'check_mk_remote'
  }
}
