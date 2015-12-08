class w32time (
  $system_type,
  $synctype,
  $ntpservers,
  $service_name,
  $announceflags,
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

  case $::os['family'] {
    'windows' : {
  	  anchor { 'w32time::begin': } ->
      class { '::w32time::config': } ~>
      class { '::w32time::service': } ->
      anchor { 'w32time::end': }
    }
      default : { fail("The ${module_name} module is not supported on an ${::os['family']} based system.") }
  }
}
