
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
		

		rem 'taskkill /im tea* /f

echo installation de kpax - releve compteur + envoie de cartouche
echo script realise par mickael videment
echo SIDERIS Ouest


		@echo off
       

			echo "https://www.kyoceradocumentsolutions.fr/content/download-center/fr/drivers/all/KX_Universal_Printer_Driver_zip.download.zip" > "%tmp%\inputbox.vbs"
        
        (
        echo path = "https://www.kyoceradocumentsolutions.fr/content/downloadcenter/fr/drivers/all/KX_Universal_Printer_Driver_zip.download.zip"
        echo pos = InStrRev(path, "/"^) +1
        echo Const DownloadDest ="https://www.kyoceradocumentsolutions.fr/content/download-center/fr/drivers/all/KX_Universal_Printer_Driver_zip.download.zip"
        echo LocalFile = Mid(path, pos^)
        echo Const webUser = "admin"
        echo Const webPass = "admin"
        echo Const DownloadType = "binary"
        echo dim strURL
        echo.
        echo function getit(^)
        echo  dim xmlhttp
        echo.
        echo  set xmlhttp=createobject("MSXML2.XMLHTTP.3.0"^)
        echo  'xmlhttp.SetOption 2, 13056 'If https -^) Ignorer toutes les erreurs SSL
        echo  strURL = DownloadDest
        echo  Wscript.Echo "Download-URL: " ^& strURL
        echo.
        echo  'Pour l'authentification de base, utilisez la liste ci-dessous, ainsi que les variables + d'utilisateurs? laisser passer
        echo  xmlhttp.Open "GET", strURL, false, WebUser, WebPass
        echo  'xmlhttp.Open "GET", strURL, false
        echo.
        echo  xmlhttp.Send
        echo  Wscript.Echo "Download-Status: " ^& xmlhttp.Status ^& " " ^& xmlhttp.statusText
        echo.
        echo  If xmlhttp.Status = 200 Then
        echo    Dim objStream
        echo    set objStream = CreateObject("ADODB.Stream"^)
        echo    objStream.Type = 1 'adTypeBinary
        echo    objStream.Open
        echo    objStream.Write xmlhttp.responseBody
        echo    objStream.SaveToFile LocalFile
        echo    objStream.Close
        echo    rem set objStream = Nothing
        echo  End If
        echo.
        echo.
        echo  set xmlhttp=Nothing
        echo End function
        echo.
        echo '=======================================================================
        echo ' Fin Defs de fonction, Start Page
        echo '=======================================================================
        echo getit(^)
        echo Wscript.Echo "Telechargement Termine. voir " ^& LocalFile ^& " pour la reussite."
        echo Wscript.Quit(intOK^)
        )>"%tmp%\httpdownload.vbs"
        ::Debut
        echo Veuillez Patienter...  Telechargement du fichier est en cours ...
        for /f "tokens=* delims=*" %%a in ('Cscript "%tmp%\httpdownload.vbs" //nologo') do (echo "%%a")
        rem Del %tmp%\httpdownload.vbs
        ::fin
        rem pause>nul
		
		IF EXIST "%systemroot%\Microsoft.NET\Framework\v3.5" goto State_Framework else goto Instal_Framework
		
		
		
		
		:instal_Framework
		rem color 1c
		color 0c
		echo Framework 3.5 installation BAD
		ping 127.0.0.1 -n 2 > nul
		color 0E
		echo Deploiement du Framework 3.5
		DISM /online /Enable-Feature /FeatureName:NetFx3 /All
		ping 127.0.0.1 -n 2 > nul
		goto State_Framework
		GOTO eof
		
		
		:State_Framework 
		color A
		echo Framework 3.5 installation ok
		ping 127.0.0.1 -n 2 > nul
		
		goto Kpax_instal
		GOTO eof
	

			
		
		
		
		
		:Kpax_instal
		echo lancement Kpax
		
        color 0B
		
		echo installation de kpaxAgent
		
		start /wait KX_Universal_Printer_Driver_zip.download.zip /passive
		rem ping 127.0.0.1 -n 30 > nul
		start "" "C:\Program Files (x86)\KPAX Soft\KPAX Agent\KPAXAgent.exe"
		ping 127.0.0.1 -n 4 > nul
        rem del %~dp0\kpaxAgent.msi
		
		
		set curpath=%~dp0
		set curpath=%curpath:~0,-1%
		echo %curpath%
		
		cd C:\Program Files (x86)\KPAX Soft\KPAX Agent
		InstallUtil KPAXService.exe
		rem Net start "KPAX service"

		rem del %curpath%\kpaxAgent.msi
		rem del %0
		set texte=sideris.kpax-manage.com
		echo %texte% | clip
		GOTO eof
	
	
