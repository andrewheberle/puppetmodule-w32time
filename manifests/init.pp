class w32time (
	$synctype,
	$ntpservers,
	$service_name,
  ) {
    
    validate_string($synctype)
    validate_array($ntpservers)

    case ${::os::family} {
  	  'Windows' : {
  	    case $synctype {
  	      'NT5DS' : { $annouceflags = 10 }
  	      'NTP'   : { $annouceflags = 5 }
  	      default : { fail("\$synctype must be set as 'NT5DS' or 'NTP' only.") }
        }

        registry::value { 'AnnouceFlags':
          key    => 'HKLM\System\CurrentControlSet\Services\W32Time\Config',
          value  => $annouceflags,
          type   => 'dword',
          notify => Service['w32tm'],
        }

        registry::value { 'Type':
          key   => 'HKLM\System\CurrentControlSet\Services\W32Time\Parameters',
          value => $synctype,
          type  => 'string',
          notify => Service['w32tm'],
        }

        registry::value { 'NtpServer':
          key   => 'HKLM\System\CurrentControlSet\Services\W32Time\Parameters',
          value => join($ntpservers, " "),
          type  => 'string',
          notify => Service['w32tm'],
        }

        service { $service_name:
          ensure => 'running',
          enable => true,
        }
      }
      default : { fail("The ${module_name} module is not supported on an ${::os::family} based system.") }
    }
}
