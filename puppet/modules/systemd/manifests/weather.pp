class systemd::weather {
file { '/usr/local/bin/weather-init.sh':
  mode    => '0755',
  owner   => 'root',
  group   => 'root',
  content => template('systemd/weather-init.erb'),
}

file { '/usr/local/bin/weather.sh':
  mode    => '0755',
  owner   => 'root',
  group   => 'root',
  require => [
		Package["jq"], 
  		File["/usr/local/bin/weather-init.sh"],
	     ],
  content => template('systemd/weather-script.erb'),
}

file {'weather-file':
   ensure => "directory",
   path   => '/root/weather-file',
   mode   => "0755",
   owner  => "root",
   group  => "root",
}

file { '/lib/systemd/system/weather.service':
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  content => template('systemd/weather.service.erb'),
  require => File["/usr/local/bin/weather-init.sh", "/usr/local/bin/weather.sh"],
}~>
exec { 'weather-systemd-reload':
  command     => 'systemctl daemon-reload',
  path        => [ '/usr/bin', '/bin', '/usr/sbin' ],
  refreshonly => true,
}

service { 'weather':
  ensure   => running,
  enable   => true,
}

file { '/usr/local/bin/backup-weather.sh':
  mode    => '0755',
  owner   => 'root',
  group   => 'root',
  content => template('systemd/backup-weather.erb'),
}

cron {'Backuping Weatcher files':
   command => "/usr/local/bin/backup-weather.sh > /var/log/backup-weather.log  2>&1",
   user    => 'root',
   hour    =>  '23',
   minute  =>  '59',
   require => File["/usr/local/bin/backup-weather.sh"],
  }

include jq
}
