class w32time::config inherits w32time {

  case $system_type {
    'pdc' : {
      $synctype = 'NTP'
      $announceflags = '5'
      $maxpollinterval = '10'
      $minpollinterval = '6'
      $updateinterval = '100'
    }
    'dc' : {
      $maxpollinterval = '10'
      $minpollinterval = '6'
      $updateinterval = '100'
    }
    'member' : {
      # Defaults from common.yaml are fine
    }
    'standalone' : {
      $synctype = 'NTP'
      $maxallowedphaseoffset = '1'
      $maxnegphasecorrection = '5400'
      $phasecorrectrate = '7'
      $updateinterval = '36000'
      $ntpclientspecialpollinterval = '604800'
    }
    default : { fail('\$system_type is invalid.') }
  }

  # Set registry key paths
  $registry_config = 'HKLM\System\CurrentControlSet\Services\W32Time\Config'
  $registry_parameters = 'HKLM\System\CurrentControlSet\Services\W32Time\Parameters'
  $registry_ntpclient = 'HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient'
  $registry_ntpserver = 'HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer'

  # HKLM\System\CurrentControlSet\Services\W32Time\Config

  registry::value { 'AnnounceFlags':
    key    => $registry_config,
    data   => $announceflags,
    value  => 'AnnounceFlags',
    type   => 'dword',
  }

  registry::value { 'EventLogFlags':
    key    => $registry_config,
    data   => $eventlogflags,
    value  => 'EventLogFlags',
    type   => 'dword',
  }

  registry::value { 'FrequencyCorrectRate':
    key    => $registry_config,
    data   => $frequencycorrectrate,
    value  => 'FrequencyCorrectRate',
    type   => 'dword',
  }
  
  registry::value { 'HoldPeriod':
    key    => $registry_config,
    data   => $holdperiod,
    value  => 'HoldPeriod',
    type   => 'dword',
  }

  registry::value { 'LargePhaseOffset':
    key    => $registry_config,
    data   => $largephaseoffset,
    value  => 'LargePhaseOffset',
    type   => 'dword',
  }

  registry::value { 'LocalClockDispersion':
    key    => $registry_config,
    data   => $localclockdispersion,
    value  => 'LocalClockDispersion',
    type   => 'dword',
  }

  registry::value { 'MaxAllowePhaseOffset':
    key    => $registry_config,
    data   => $maxallowedphaseoffset,
    value  => 'MaxAllowePhaseOffset',
    type   => 'dword',
  }

  registry::value { 'MaxNegPhaseCorrection':
    key    => $registry_config,
    data   => $maxnegphasecorrection,
    value  => 'MaxNegPhaseCorrection',
    type   => 'dword',
  }

  registry::value { 'MaxPollInterval':
    key    => $registry_config,
    data   => $maxpollinterval,
    value  => 'MaxPollInterval',
    type   => 'dword',
  }

  registry::value { 'MaxPosPhaseCorrection':
    key    => $registry_config,
    data   => $maxposphasecorrection,
    value  => 'MaxPosPhaseCorrection',
    type   => 'dword',
  }

  registry::value { 'MinPollInterval':
    key    => $registry_config,
    data   => $minpollinterval,
    value  => 'MinPollInterval',
    type   => 'dword',
  }

  registry::value { 'PhaseCorrectRate':
    key    => $registry_config,
    data   => $phasecorrectrate,
    value  => 'PhaseCorrectRate',
    type   => 'dword',
  }

  registry::value { 'PollAdjustFactor':
    key    => $registry_config,
    data   => $polladjustfactor,
    value  => 'PollAdjustFactor',
    type   => 'dword',
  }

  registry::value { 'SpikeWatchPeriod':
    key    => $registry_config,
    data   => $spikewatchperiod,
    value  => 'SpikeWatchPeriod',
    type   => 'dword',
  }

  registry::value { 'UpdateInterval':
    key    => $registry_config,
    data   => $updateinterval,
    value  => 'UpdateInterval',
    type   => 'dword',
  }

  # HKLM\System\CurrentControlSet\Services\W32Time\Parameters

  registry::value { 'Type':
    key   => $registry_parameters,
    data  => $synctype,
    value => 'Type',
    type  => 'string',
  }

  registry::value { 'NtpServer':
    key   => $registry_parameters,
    data  => join($ntpservers, " "),
    value => 'NtpServer',
    type  => 'string',
  }

  # HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient

  registry::value { 'NtpClientAllowNonstandardModeCombinations':
    key   => $registry_ntpclient,
    data  => $ntpclientallownonstandardmodecombinations,
    value => 'AllowNonstandardModeCombinations',
    type  => 'dword',
  }

  registry::value { 'NtpClientCompatibilityFlags':
    key   => $registry_ntpclient,
    data  => $ntpclientcompatibilityflags,
    value => 'CompatibilityFlags',
    type  => 'dword',
  }

  registry::value { 'NtpClientCrossSiteSyncFlags':
    key   => $registry_ntpclient,
    data  => $ntpclientcrosssitesyncflags,
    value => 'CrossSiteSyncFlags',
    type  => 'dword',
  }

  registry::value { 'NtpClientEnabled':
    key   => $registry_ntpclient,
    data  => $ntpclientenabled,
    value => 'Enabled',
    type  => 'dword',
  }

  registry::value { 'NtpClientEventLogFlags':
    key   => $registry_ntpclient,
    data  => $ntpclienteventlogflags,
    value => 'EventLogFlags',
    type  => 'dword',
  }

  registry::value { 'NtpClientInputProvider':
    key   => $registry_ntpclient,
    data  => $ntpclientinputprovider,
    value => 'InputProvider',
    type  => 'dword',
  }

  registry::value { 'NtpClientLargeSampleSkew':
    key   => $registry_ntpclient,
    data  => $ntpclientlargesampleskew,
    value => 'LargeSampleSkew',
    type  => 'dword',
  }

  registry::value { 'NtpClientResolvePeerBackoffMinutes':
    key   => $registry_ntpclient,
    data  => $ntpclientresolvepeerbackoffminutes,
    value => 'ResolvePeerBackoffMinutes',
    type  => 'dword',
  }

  registry::value { 'NtpClientResolvePeerBackoffMaxtimes':
    key   => $registry_ntpclient,
    data  => $ntpclientresolvepeerbackoffmaxtimes,
    value => 'ResolvePeerBackoffMaxtimes',
    type  => 'dword',
  }

  registry::value { 'NtpClientSpecialPollInterval':
    key   => $registry_ntpclient,
    data  => $ntpclientspecialpollinterval,
    value => 'SpecialPollInterval',
    type  => 'dword',
  }

  # HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer
  
  registry::value { 'NtpServerAllowNonstandardModeCombinations':
    key   => $registry_ntpserver,
    data  => $ntpserverallownonstandardmodecombinations,
    value => 'AllowNonstandardModeCombinations',
    type  => 'dword',
  }

  registry::value { 'NtpServerEnabled':
    key   => $registry_ntpserver,
    data  => $ntpclientenabled,
    value => 'Enabled',
    type  => 'dword',
  }

  registry::value { 'NtpServerInputProvider':
    key   => $registry_ntpserver,
    data  => $ntpserverinputprovider,
    value => 'InputProvider',
    type  => 'dword',
  }

}