@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:

@echo off
cls
Rem ---------------------------------------------------------------
Rem Fichier : ViderSpouleur.bat
Rem Batch original trouve dans le Windows News No144 juin 2006.
Rem ---------------------------------------------------------------
Rem mvidement Sideris Ouest  7 03 2014
Rem ---------------------------------------------------------------
echo --------------------------------------------------------------
echo Procedure d'arret du spouleur d'impression
echo           de suppression des documents de la file d'impression
echo        et de redemarrage du soupleur d'impression...
echo --------------------------------------------------------------
net stop spooler
ping 127.0.0.1 -n 4 >nul
echo Suppression des document de la file d'impression
del %systemroot%\system32\spool\printers\*.* /F /Q /S
ping 127.0.0.1 -n 3 >nul
net start spooler
echo Procedure terminee !
