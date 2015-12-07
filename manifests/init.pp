class w32time (
  $system_type,
  $registry_config,
  $registry_paramters,
  $registry_ntpclient,
  $registry_ntpserver,
  $synctype,
  $ntpservers,
  $service_name,
  $annouceflags,
  $eventlogflags,
  $frequencycorrectrate,
  $holdperiod,
  $largephaseoffset,
  $localclockdispersion,
  $maxallowedphaseoffset,
  $maxnegphasecorrection,
  $maxpollinterval,
  $maxposphasecorrection,
  $minpollinterval,
  $phasecorrectrate,
  $polladjustfactor,
  $spikewatchperiod,
  $updateinterval,
  $ntpclientallownonstandardmodecombinations,
  $ntpclientcompatibilityflags,
  $ntpclientcrosssitesyncflags,
  $ntpclientenabled,
  $ntpclienteventlogflags,
  $ntpclientinputprovider,
  $ntpclientlargesampleskew,
  $ntpclientresolvepeerbackoffminutes,
  $ntpclientresolvepeerbackoffmaxtimes,
  $ntpclientspecialpollinterval,
  $ntpserverallownonstandardmodecombinations,
  $ntpserverenabled,
  $ntpserverinputprovider,
  ) {
    
  validate_string($system_type)    
  validate_string($synctype)
  validate_array($ntpservers)
  validate_string($service_name)

  case ${::os::family} {
    'Windows' : {
  	  case $system_type {
  	    'standalone' : { notice('Using defaults for standalone machine.') }
  	    'member'     : { notice('Using defaults for domain member.') }
  	    'dc'         : { notice('Using defaults for domain controller.') }
  	    'pdc'        : { notice('Using defaults for primary domain controller.') }
  	    default : { fail("\$system_type is invalid") }
      }
        
      anchor { 'w32time::begin': } ->
      class { '::w32time::config': } ~>
      class { '::w32time::service': } ->
      anchor { 'w32time::end': }
    }
      default : { fail("The ${module_name} module is not supported on an ${::os::family} based system.") }
  }
}
