net localgroup|findstr "ToolsMachines"||net localgroup "ToolsMachines" /add&&net localgroup "ToolsMachines" "NT AUTHORITY\Network Service" /add
NET LOCALGROUP "ToolsMachines" "FAREAST\foamliu" "FAREAST\v-susu" /add
NET LOCALGROUP "ToolsMachines" "FAREAST\V-SUSU-DEV-04$" /add
NET LOCALGROUP "ToolsMachines" "FAREAST\V-SUSU-API-01$" "FAREAST\V-SUSU-API-02$" "FAREAST\V-SUSU-API-03$" /add