@ECHO OFF& TITLE п╤ть
:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
taskkill /f /im Xshell* 2
sc stop "FlexNet Licensing Service"
sc delete "FlexNet Licensing Service"
taskkill /f /im Xshell* >NUL 2>NUL
rd/s/q "%ProgramData%\NetSarang\Xshell" 2>NUL
rd/s/q "%AllUsersProfile%\NetSarang\Xshell"2>NUL
reg delete HKCU\Software\NetSarang\Xshell /F>NUL 2>NUL
reg delete HKLM\SOFTWARE\NetSarang\Xshell /F>NUL 2>NUL
reg delete HKLM\SOFTWARE\Wow6432Node\NetSarang\Xshell /F>NUL 2>NUL
