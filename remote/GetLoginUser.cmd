@ECHO OFF

Echo IP:%1
Set t_ip=%1
Net use Z: /delete
Net use Z: \\%t_ip%\C$ #Bugsfor$ /user:Administrator
Reg query "\\%t_ip%\HKEY_USERS\S-1-5-21-912058808-2646073062-3024180614-500\Volatile Environment\2"
