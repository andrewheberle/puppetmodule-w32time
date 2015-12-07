class w32time::config inherits w32time {

  # HKLM\System\CurrentControlSet\Services\W32Time\Config

  registry::value { 'AnnouceFlags':
    key    => $registry_config,
    value  => $annouceflags,
    type   => 'dword',
  }

  registry::value { 'EventLogFlags':
    key    => $registry_config,
    value  => $eventlogflags,
    type   => 'dword',
  }

  registry::value { 'FrequencyCorrectRate':
    key    => $registry_config,
    value  => $frequencycorrectrate,
    type   => 'dword',
  }
  
  registry::value { 'HoldPeriod':
    key    => $registry_config,
    value  => $holdperiod,
    type   => 'dword',
  }

  registry::value { 'LargePhaseOffset':
    key    => $registry_config,
    value  => $largephaseoffset,
    type   => 'dword',
  }

  registry::value { 'LocalClockDispersion':
    key    => $registry_config,
    value  => $localclockdispersion,
    type   => 'dword',
  }

  registry::value { 'MaxAllowePhaseOffset':
    key    => $registry_config,
    value  => $maxallowedphaseoffset,
    type   => 'dword',
  }

  registry::value { 'MaxNegPhaseCorrection':
    key    => $registry_config,
    value  => $maxnegphasecorrection,
    type   => 'dword',
  }

  registry::value { 'MaxPollInterval':
    key    => $registry_config,
    value  => $maxpollinterval,
    type   => 'dword',
  }

  registry::value { 'MaxPosPhaseCorrection':
    key    => $registry_config,
    value  => $maxposphasecorrection,
    type   => 'dword',
  }

  registry::value { 'MinPollInterval':
    key    => $registry_config,
    value  => $minpollinterval,
    type   => 'dword',
  }

  registry::value { 'PhaseCorrectRate':
    key    => $registry_config,
    value  => $phasecorrectrate,
    type   => 'dword',
  }

  registry::value { 'PollAdjustFactor':
    key    => $registry_config,
    value  => $polladjustfactor,
    type   => 'dword',
  }

  registry::value { 'SpikeWatchPeriod':
    key    => $registry_config,
    value  => $spikewatchperiod,
    type   => 'dword',
  }

  registry::value { 'UpdateInterval':
    key    => $registry_config,
    value  => $updateinterval,
    type   => 'dword',
  }

  # HKLM\System\CurrentControlSet\Services\W32Time\Parameters

  registry::value { 'Type':
    key   => $registry_parameters,
    value => $synctype,
    type  => 'string',
  }

  registry::value { 'NtpServer':
    key   => $registry_parameters,
    value => join($ntpservers, " "),
    type  => 'string',
  }

  # HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient

  registry::value { 'AllowNonstandardModeCombinations':
    key   => $registry_ntpclient,
    value => $ntpclientallownonstandardmodecombinations,
    type  => 'dword',
  }

  registry::value { 'CompatibilityFlags':
    key   => $registry_ntpclient,
    value => $ntpclientcompatibilityflags,
    type  => 'dword',
  }

  registry::value { 'CrossSiteSyncFlags':
    key   => $registry_ntpclient,
    value => $ntpclientcrosssitesyncflags,
    type  => 'dword',
  }

  registry::value { 'Enabled':
    key   => $registry_ntpclient,
    value => $ntpclientenabled,
    type  => 'dword',
  }

  registry::value { 'EventLogFlags':
    key   => $registry_ntpclient,
    value => $ntpclienteventlogflags,
    type  => 'dword',
  }

  registry::value { 'InputProvider':
    key   => $registry_ntpclient,
    value => $ntpclientinputprovider,
    type  => 'dword',
  }

  registry::value { 'LargeSampleSkew':
    key   => $registry_ntpclient,
    value => $ntpclientlargesampleskew,
    type  => 'dword',
  }

  registry::value { 'ResolvePeerBackoffMinutes':
    key   => $registry_ntpclient,
    value => $ntpclientresolvepeerbackoffminutes,
    type  => 'dword',
  }

  registry::value { 'ResolvePeerBackoffMaxtimes':
    key   => $registry_ntpclient,
    value => $ntpclientresolvepeerbackoffmaxtimes,
    type  => 'dword',
  }

  registry::value { 'SpecialPollInterval':
    key   => $registry_ntpclient,
    value => $ntpclientspecialpollinterval,
    type  => 'dword',
  }

  # HKLM\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer
  
  registry::value { 'AllowNonstandardModeCombinations':
    key   => $registry_ntpserver,
    value => $ntpserverallownonstandardmodecombinations,
    type  => 'dword',
  }

  registry::value { 'Enabled':
    key   => $registry_ntpserver,
    value => $ntpclientenabled,
    type  => 'dword',
  }

  registry::value { 'InputProvider':
    key   => $registry_ntpserver,
    value => $ntpserverinputprovider,
    type  => 'dword',
  }

}