class apache::config($websitename,$webdir,$webconfig,$webport,$webname) {


	file {"$websitename config file":
	path =>  "/etc/httpd/conf.d/$webconfig",
	#source => "puppet:///modules/apache/web.conf",
	content => template('apache/web.erb'),
	ensure => present,
	}

	file {"web document Root":
	path => "/var/www/$webdir",
        ensure => directory,
	}

	file {"web contents":
		path => "/var/www/$webdir/index.html",
		content => "welcome to puppet training",
		ensure => present,
		}
}
