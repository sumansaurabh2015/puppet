define apache::vhost($websitename,$webdir,$webconfig,$webport,$webname) {


	file {"$name $websitename config file":
	path =>  "/etc/httpd/conf.d/$webconfig",
	#source => "puppet:///modules/apache/web.conf",
	content => template('apache/web.erb'),
	ensure => present,
	}

	file {"$name web document Root":
	path => "/var/www/$webdir",
        ensure => directory,
	}

	file {"$name web contents":
		path => "/var/www/$webdir/index.html",
		content => "welcome to puppet training",
		ensure => present,
		}
}
