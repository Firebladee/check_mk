# /etc/puppet/modules/check_mk/manifests/init.pp

class check_mk (
  $omd_site       = 'ALL',
  $install        = 'agent',
  $parents        = '',
  $check_mk_tags  = '',
  $check_mk_tags  = '',
  $check_mk_alias = '',

  $check_mk_agent          = 'check_mk-agent-1.2.2p3-1.noarch.rpm',
  $omd_site_home           = "/opt/omd/sites/${omd_site}",
  $check_mk_location       = "${omd_site_home}/etc/check_mk",
  $check_mk_agent_location = "${check_mk_location}/agents",

)
{

  if $check_mk::install == 'agent' or $check_mk::install == 'server'{

    check_mk::agent { $omd_site:
      omd_site_home           => $omd_site_home,
      check_mk_location       => $check_mk_location,
#      check_mk_agent_location => $check_mk_agent_location,
      check_mk_tags           => $check_mk_tags,
      check_mk_agent          => $check_mk_agent,
    }
  }

  if $check_mk::install == 'server' {
    check_mk::server { $omd_site: }
  }

  if $check_mk::parents {
    check_mk::parents { $omd_site: }
  }
}
