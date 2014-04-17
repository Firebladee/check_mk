# /etc/puppet/modules/check_mk/manifests/init.pp

class check_mk (
  $omd_site       = $check_mk::params::omd_site,
  $install        = $check_mk::params::install,
  $parents        = $check_mk::params::parents,
  $check_mk_tags  = $check_mk::params::check_mk_tags,
  $check_mk_alias = $check_mk::params::check_mk_alias,
) inherits check_mk::params {

  if $check_mk::install == 'agent' or $check_mk::install == 'server'{

    $check_mk_agent          = 'check_mk-agent-1.2.2p3-1.noarch.rpm'
    $omd_site_home           = "/opt/omd/sites/${omd_site}"
    $check_mk_location       = "${omd_site_home}/etc/check_mk"
    $check_mk_agent_location = "${check_mk_location}/agents"

#    package { 'nagios-plugins-setuid': ensure => latest; }

    #TODO: Add details for different os
    #FIXME: Move to agent.pp
    case $::osfamily {
      RedHat:{
        file { "/tmp/${check_mk_agent}":
          ensure => present,
          path   => "/tmp/${check_mk_agent}",
          source => "puppet:///modules/check_mk/${check_mk_agent}",
        }

        exec { "rpm -i /tmp/${check_mk_agent}":
          cwd     => '/tmp',
          creates => '/usr/bin/check_mk_agent',
          require => File["/tmp/${check_mk_agent}"],
        }
      }
      Debian:{ package { 'check-mk-agent': ensure => latest}}
      default: {notify{'OS not support for check_mk agent':}}
    }

    check_mk::agent { $omd_site: 
      omd_site_home           => $omd_site_home,
      check_mk_location       => $check_mk_location,
      check_mk_agent_location => $check_mk_agent_location,
    }
  }

  if $check_mk::install == 'server' {
    check_mk::server { $omd_site: }
  }

  if $check_mk::parents {
    check_mk::parents { $omd_site: }
  }
}
