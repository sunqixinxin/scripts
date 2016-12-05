set fromLocation=\\cpdfs\build\TFS\CSH\Drops\BizTools_CodeSign\Tools.Work_Gated_20150511.2_0511070906
:: If toLocation does not exist, Robocopy will create it.
set toLocation=H:\OfficialBits\Tools.Work\Tools.Work_Gated_20150511.2_codesign

CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16