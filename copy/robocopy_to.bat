::set fromLocation=D:\SourceCode\cscp.main
:::: If toLocation does not exist, Robocopy will create it.
::set toLocation=L:\SourceCode\cscp.main
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16
::
::set fromLocation=D:\SourceCode\csscs.main
::set toLocation=L:\SourceCode\csscs.main
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16
::
::set fromLocation=D:\SourceCode\cspayments.main
::set toLocation=L:\SourceCode\cspayments.main
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16
::
::set fromLocation=D:\SourceCode\SunnyToolManager
::set toLocation=L:\SourceCode\SunnyToolManager
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16

::set fromLocation=D:\SourceCode\Tools.Main
::set toLocation=L:\SourceCode\Tools.Main
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16

::set fromLocation=D:\SourceCode\csbilling.main
::set toLocation=L:\SourceCode\csbilling.main
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16

::set fromLocation=D:\SourceCode\csOI.main
::set toLocation=L:\SourceCode\csOI.main
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16

set fromLocation=H:\SourceCode\Tools.Main
set toLocation=D:\SourceCode\Tools.Main
CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16

::set fromLocation=D:\SourceCode\Others
::set toLocation=L:\SourceCode\Others
::CALL ROBOCOPY "%fromLocation%" "%toLocation%" /e /MT:16