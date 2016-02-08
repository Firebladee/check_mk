# /etc/puppet/modules/check_mk/manifests/init.pp

class check_mk (
#  $omd_site       = 'ALL',
#  $install        = 'agent',
#  $parents        = '',
#  $check_mk_tags  = '',
#  $check_mk_tags  = '',
#  $check_mk_alias = '',

#  $omd_site_home           = "/opt/omd/sites/${omd_site}",
#  $check_mk_location       = "${omd_site_home}/etc/check_mk",
#  $check_mk_agent_location = "${check_mk_location}/agents",

#  $hash = [],

)
{

  if $check_mk::install == 'agent' or $check_mk::install == 'server'{
    create_resource('check_mk::agent', $hash)

#    check_mk::agent { $omd_site:
#      omd_site_home           => $omd_site_home,
#      check_mk_location       => $check_mk_location,
#      check_mk_agent_location => $check_mk_agent_location,
#      check_mk_tags           => $check_mk_tags,
#      check_mk_agent          => $check_mk_agent,
#    }
  }

  if $check_mk::install == 'server' {
#    check_mk::server { $omd_site: }
    create_resource('check_mk::server', $hash)
  }

  if $check_mk::parents {
#    check_mk::parents { $omd_site: }
    create_resource('check_mk::server', $hash)
  }
}
