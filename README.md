[![Build Status](https://travis-ci.org/Firebladee/check_mk.png?branch=master)](https://travis-ci.org/Firebladee/check_mk)
[![Coverage Status](https://coveralls.io/repos/Firebladee/check_mk/badge.svg)](https://coveralls.io/r/Firebladee/check_mk)
[![endorse](https://api.coderwall.com/firebladee/endorsecount.png)](https://coderwall.com/firebladee)


## Check_mk

Created by Fireblade

This recipe will install the check_mk agent on target machines and will update the check_mk server with the new agent.

### Usage

Clients
TO add a new agent.
```
class { 'check_mk':
	install  => 'agent',
	omd_site => 'ALL',
}
```

To add parents
```
class { 'check_mk':
	install  => 'agent',
	omd_site => 'ALL',
	parents  => '172.18.145.11',
}
```

To add tags
```
class { 'check_mk':
	install		    => 'agent',
	omd_site    	=> ['ALL', 'DEV2'],
	check_mk_tags	=> ['SSH', 'Management'],
}
```

For host alias
```
class { 'check_mk':
	install        => 'agent',
	omd_site       => 'ALL',
	check_mk_alias => 'This server does nothing',
}
```

Server
To add the server
```
class { 'check_mk':
	install  => 'server',
	omd_site => ['DEV1', 'ALL'],
}
```

If you add the omd recipe then puppet will create the sites for you.
```
$omd_site	= ['DEV1', 'ALL']
include omd
include omd::site::add
```

