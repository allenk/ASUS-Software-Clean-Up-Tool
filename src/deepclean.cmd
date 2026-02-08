@echo off
:: ------------------------------------------------------------------------------------------------------------
:: Clean Up ASUS All
:: ------------------------------------------------------------------------------------------------------------
:: The tool helps to clean up all ASUS software from system
:: ------------------------------------------------------------------------------------------------------------
:: Before running the tools,
:: 1. Complete backup your system.
:: 2. Disable ASUS Apps from BIOS (MyASUS and Armoury)
:: 3. Run ASUS remove tools (Armoury Crate Uninstall Tool.exe, or geek_uninstall.exe).
:: 4. Remove all ASUS applications, including AISuite, ASUSIme, etc. via their uninstall tool.
:: 5. Reboot and then Run the tool with Admin permission.
:: 6. Reboot to finish all clean up.
:: 7. Run the tool repeatedly to do backup and clean again and again.
:: ------------------------------------------------------------------------------------------------------------
echo ASUS Clean Up Tool 0.1a ... kwyshell@gmail.com
echo.

setlocal EnableDelayedExpansion

echo "Are you sure to clean up all ASUS resources from your system?"
choice /C YN /N /M "Select (Y/N): "
if errorlevel 2 goto ENDPROG

:STEP0
:: uninstall applications via their setup
echo.
echo Remove Apps (You may need to interact with setup programs!)

:: the new version Armoury Crate built-in uninstall tool so try to remove Armoury Crate before deep clean
echo.
echo Remove ArmouryCrate App ...
powershell.exe -Command "Get-AppxPackage *ArmouryCrate* -allusers | Remove-AppPackage"

echo Uninstall ... ASUS AIOFanSDK
start /wait "" "C:\Program Files (x86)\InstallShield Installation Information\{06EA142E-8DA4-4917-8AD5-443F483B502D}\setup.exe" -runfromtemp -l0x0409  -removeonly /s /uninst

echo Uninstall ... ASUS AURA DRAM Component
start /wait "" "C:\ProgramData\Package Cache\{179f415f-2ff3-4db1-bcc1-d5730f746db8}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{9cfd6488-af6d-4b35-9df3-e16b0c6b791b}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{a06f2235-c1cb-4cd6-91ac-30089f052973}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{5d3c3229-f8ae-4c6c-9db7-7231adc1ff08}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{c1d017c2-8846-4000-9254-5689eccd462e}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{f70a8a88-540d-485d-9aa8-001486fb050e}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{205ef3a8-937b-43cb-90fc-2f58f71408d8}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{2715ff64-a3f2-4e15-a47b-6d6ece95d7a2}\AacSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{e42c5874-37b0-4977-9e8d-70bf006e1f76}\AacSetup.exe" /uninstall /s

echo Uninstall ... AURA lighting effect add-on
start /wait "" MsiExec.exe /x {1E2EA04B-FCA7-457E-B6F4-F33E1858E859} /qn

echo Uninstall ... ASUS ROG FAN XPERT 4
start /wait "" "C:\Program Files (x86)\InstallShield Installation Information\{2dfe216d-3481-4684-ad4d-2566bd7cfe4f}\Setup.exe" -uninstall /s

echo Uninstall ... ASUS Framework
start /wait "" "C:\Program Files (x86)\InstallShield Installation Information\{339A6383-7862-46DA-8A9D-E84180EF9424}\FrameworkServiceSetup.exe" /uninstall /s

echo Uninstall ... ASUS MB Resource
start /wait "" "C:\ProgramData\Package Cache\{39cdaa93-c446-4421-a337-1e52705dd2f8}\AacMBSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{40dadfa2-acc5-4f75-9138-52616f20c493}\AacMBSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{00aac91e-7198-484b-b29d-1c9990d843ae}\AacMBSetup.exe" /uninstall /s

echo Uninstall ... ASUS AIO FAN
start /wait "" "C:\ProgramData\Package Cache\{45ece30d-a966-424e-9bce-f740797c5348}\AacAIOFanSetup.exe" /uninstall /s
start /wait "" "C:\ProgramData\Package Cache\{fe989498-9799-4e99-9430-39e107988b01}\AacAIOFanSetup.exe" /uninstall /s

echo Uninstall ... ASUS AURA Extension Card HAL
start /wait "" "C:\ProgramData\Package Cache\{4e2b05b0-eb08-41e5-9eb3-cdcc43d6bee0}\AacExtCardSetup.exe" /uninstall /s

echo Uninstall ... ASUS Armoury Main SDK
start /wait "" "C:\Program Files (x86)\InstallShield Installation Information\{6EE02C78-E908-493B-B1A6-D64AFC53002F}\setup.exe" -runfromtemp -l0x0409  -removeonly /uninstall

taskkill /f /im GameBar.exe
echo Uninstall ... GameSDK Service
start /wait "" MsiExec.exe /x {7160DA8D-3F25-4F6E-ABC8-F693551D82FA} /qn

echo Uninstall ... ROG RYUO III
start /wait "" "C:\Program Files (x86)\InstallShield Installation Information\{84558862-ba54-4c7a-b3f0-b6d76641d4a0}\Setup.exe" -uninstall /s

echo Uninstall ... ASUS Motherboard
start /wait "" "C:\Program Files (x86)\InstallShield Installation Information\{93795eb8-bd86-4d4d-ab27-ff80f9467b37}\Setup.exe" -uninstall /s

echo Uninstall ... AI Suite 3
start /wait "" "C:\ProgramData\ASUS\AI Suite III\Setup.exe" -u -s

echo Uninstall ... ASUS Driver Hub
start /wait "" "C:\Program Files\ASUS\AsusDriverHubInstaller\ASUS-DriverHub-Installer.exe" /u

echo Uninstall ... Armoury Crate Service
start /wait "" "C:\Program Files\ASUS\Armoury Crate Service\ArmouryCrate.Uninstaller.exe" /u

echo Uninstall ... AniMe Matrix Font
start /wait "" MsiExec.exe /x {70ABCE41-0F10-4E36-9C93-1AFB1DF2AF42} /qn

echo Uninstall ... ASUS Smart Input Service
start /wait "" MsiExec.exe /x {D6B9E727-05B5-46EC-966F-321705D21FD2} /qn

echo Uninstall ... ASUS AURA Extension Card HAL
start /wait "" MsiExec.exe /x {237E1CAC-1708-4940-AC34-DF15C079AB70} /qn

echo Uninstall ... ROG Live Service
start /wait "" MsiExec.exe /x {2D87BFB6-C184-4A59-9BBE-3E20CE797631} /qn

echo Uninstall ... AniMe Matrix MB EN
start /wait "" MsiExec.exe /x {399B6DA7-B609-426E-95F8-B9A83FB7D06E} /qn

echo Uninstall ... ASUS AURA Motherboard HAL
start /wait "" MsiExec.exe /x {4EBEAC95-76BC-46A8-8644-6E2F1C87CF70} /qn

echo Uninstall ... ROGFontInstaller
start /wait "" MsiExec.exe /x {605108C1-153E-43D8-8A67-7CE326B00ECA} /qn

echo Uninstall ... AURA DRAM Component
start /wait "" MsiExec.exe /x {6FB66775-BB93-4D0A-9871-4CC9B2E87BF3} /qn

echo Uninstall ... AURA lighting effect add-on x64
start /wait "" MsiExec.exe /x {C5A4A164-4428-4931-B728-96EEF0FA3C44} /qn

echo Uninstall ... ASUS Aura SDK
start /wait "" MsiExec.exe /x {CF8E6E00-9C03-4440-81C0-21FACB921A6B} /qn

echo Uninstall ... ASUS AIOFan HAL
start /wait "" MsiExec.exe /x {EAE80DED-1A39-41C5-9F60-87CC947F6454} /qn

echo Uninstall ... ARMOURY CRATE Lite Service
start /wait "" MsiExec.exe /x {EF3944FF-2501-4568-B15C-5701E726719E} /qn

echo Uninstall ... RefreshRateService
start /wait "" MsiExec.exe /x {7E5E84CB-B190-4658-A4DC-166779C329D1} /qn

echo Uninstall ... ASUS_FRQ_Control
start /wait "" MsiExec.exe /x {8714A8D1-0F08-4681-9DF6-A8C4607A58B4} /qn

echo Uninstall ... ASUS AURA Motherboard HAL
start /wait "" MsiExec.exe /x {359B9A9D-A289-4962-BCE2-13EBFD50D532} /qn

echo Uninstall ... ROGFontInstaller
start /wait "" MsiExec.exe /x {605108C1-153E-43D8-8A67-7CE326B00ECA} /qn

echo Uninstall ... AURA DRAM Component
start /wait "" MsiExec.exe /x {86D4C8A2-DB22-4948-950D-28DD5145F91C} /qn

echo Uninstall ... AniMeVisionFont_MB
start /wait "" MsiExec.exe /x {93E38BA3-9745-4D67-91BC-F65F81523D0A} /qn

echo Uninstall ... ASUS Ambient HAL
start /wait "" MsiExec.exe /x {BC4DB8AE-8E55-4B06-8656-FB1E4A035A11} /qn

echo Uninstall ... AniMeVisionFont_AIO
start /wait "" MsiExec.exe /x {E980EAD4-0B34-484A-993C-BB6B3852F41C} /qn

:: Stop ASUS services and drivers
sc stop ArmouryCrateControlInterface
sc stop ASUSLinkNear
sc stop ASUSLinkRemote
sc stop ASUSLinkNearExt
sc stop ASUSSoftwareManager
sc stop ASUSSwitch
sc stop ASUSSystemAnalysis
sc stop ASUSSystemDiagnosis
sc stop AsusROGLSLService
sc stop AsusAppService
sc stop ASUSSoftwareManager
sc stop asus
sc stop asusm
sc stop AsusCertService
sc stop "GameSDK Service"
sc stop AsusFanControlService
sc stop AsusUpdateCheck
sc stop LightingService
sc stop IOMap
sc stop RefreshRateService
sc stop ASUSOptimization

:: Stop kernel drivers
sc stop asusgio2
sc stop asusgio3

:: Delete ASUS services and drivers
sc delete ArmouryCrateControlInterface
sc delete ASUSLinkNear
sc delete ASUSLinkRemote
sc delete ASUSLinkNearExt
sc delete ASUSSoftwareManager
sc delete ASUSSwitch
sc delete ASUSSystemAnalysis
sc delete ASUSSystemDiagnosis
sc delete AsusROGLSLService
sc delete AsusAppService
sc delete ASUSSoftwareManager
sc delete asus
sc delete asusm
sc delete AsusCertService
sc delete "GameSDK Service"
sc delete AsusFanControlService
sc delete AsusUpdateCheck
sc delete LightingService
sc delete IOMap
sc delete RefreshRateService
sc delete ASUSOptimization

:: Delete kernel drivers
sc delete asusgio2
sc delete asusgio3

:: kill ASUS process
taskkill /f /im atkexComSvc.exe
taskkill /f /im AsusCertService.exe
taskkill /f /im AsSysCtrlService.exe
taskkill /f /im ArmourySwAgent.exe
taskkill /f /im LightingService.exe
taskkill /f /im RefreshRateService.exe
taskkill /f /im ASUS_FRQ_Control.exe
taskkill /f /im "ASUS DriverHub.exe"
taskkill /f /im AsusDownLoadLicense.exe
taskkill /f /im extensionCardHal_x86.exe
taskkill /f /im Aac3572MbHal_x86.exe
taskkill /f /im Aac3572DramHal_x86.exe
taskkill /f /im AacKingstonDramHal_x86.exe
taskkill /f /im AacKingstonDramHal_x64.exe
taskkill /f /im Aac3572MbHal_x86.exe

WMIC Process Where "ExecutablePath='C:\\Program Files (x86)\\ASUS\\ArmouryDevice\\dll\\AcPowerNotification\\AcPowerNotification.exe'" Call Terminate
WMIC Process Where "ExecutablePath='C:\\Program Files (x86)\\ASUS\\ArmouryDevice\\dll\\ArmourySocketServer\\ArmourySocketServer.exe'" Call Terminate
WMIC Process Where "ExecutablePath='C:\\Program Files (x86)\\ASUS\\ArmouryDevice\\asus_framework.exe'" Call Terminate
WMIC Process Where "ExecutablePath='C:\\Program Files (x86)\\ASUS\\ArmouryDevice\\dll\\MBLedSDK\\NoiseCancelingEngine.exe'" Call Terminate
WMIC Process Where "ExecutablePath='C:\\Program Files (x86)\\ASUS\\ArmouryDevice\\dll\\ShareFromArmouryIII\\Mouse\\ROG STRIX CARRY\\P508PowerAgent.exe'" Call Terminate
WMIC Process Where "ExecutablePath='C:\\Program Files (x86)\\ASUS\\GameSDK Service\\GameSDK.exe'" Call Terminate
WMIC Process Where "ExecutablePath='C:\\Program Files\\ASUS\\AsusDriverHub\\ADU.exe'" Call Terminate

:: stop and remote Notebook or Laptop related drivers and services
echo Uninstall Notebook or Laptop Drivers and Apps
echo Searching for ASUS System Control Interface related drivers...
for /f "tokens=*" %%i in ('powershell -Command "Get-WmiObject -Query \"SELECT * FROM Win32_PnPSignedDriver WHERE DeviceName LIKE 'ASUS System Control Interface%'\" | Select-Object -ExpandProperty InfName"') do (
	set INFNAME=%%i
	echo Found INF File: !INFNAME!

	echo Deleting driver with INF file: !INFNAME!
	pnputil /delete-driver !INFNAME! /uninstall
)

:STEP1
:: create backup folders
mkdir "_backup_" 2>nul
mkdir "_backup_\registry" 2>nul

:: backup and remove folders
SET packagelist="C:\Program Files (x86)\ASUS" "C:\Program Files\ASUS" "C:\ProgramData\ASUS" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\ASUS" "C:\Windows\System32\Tasks_Migrated\ASUS" "C:\Windows\System32\Tasks\ASUS"
SET packagelist=%packagelist% "C:\Windows\System32\config\systemprofile\AppData\Local\ASUS" "%USERPROFILE%\AppData\Local\ASUS" "%USERPROFILE%\AppData\Roaming\ASUS" "C:\Program Files (x86)\LightingService"
SET packagelist=%packagelist% "%USERPROFILE%\AppData\Local\nhAsusStrix1.0.9" "%USERPROFILE%\AppData\Local\nhAsusStrix1.1.2"
SET packagelist=%packagelist% "%USERPROFILE%\Downloads\B9ECED6F.ASUSPCAssistant_qmba6cd70vzyy!App"
SET packagelist=%packagelist% "C:\Program Files (x86)\InstallShield Installation Information\{06EA142E-8DA4-4917-8AD5-443F483B502D}" "C:\Program Files (x86)\InstallShield Installation Information\{2dfe216d-3481-4684-ad4d-2566bd7cfe4f}"
SET packagelist=%packagelist% "C:\Program Files (x86)\InstallShield Installation Information\{339A6383-7862-46DA-8A9D-E84180EF9424}" "C:\Program Files (x86)\InstallShield Installation Information\{6EE02C78-E908-493B-B1A6-D64AFC53002F}"
SET packagelist=%packagelist% "C:\Program Files (x86)\InstallShield Installation Information\{84558862-ba54-4c7a-b3f0-b6d76641d4a0}" "C:\Program Files (x86)\InstallShield Installation Information\{93795eb8-bd86-4d4d-ab27-ff80f9467b37}"
SET packagelist=%packagelist% "%USERPROFILE%\AppData\Roaming\asus_framework"

echo.
echo Backup and Clean Folders ...
for %%i in (%packagelist%) do (
	SET token=%%i
	SET token0=!token:"=!
	SET token1=!token:"=!
	SET token1=!token1::\=_!
	SET token2=!token1:\=_!
	SET output=!token1!
	echo ============================================
	echo --- Folder !token0!
	echo ============================================
	echo.
	robocopy "!token0!" ".\_backup_\folders\!output!" /E /Z /MOVE /COPYALL /R:5 /W:5 /LOG:".\_backup_\cleanfolders_!token2!.log"
	::rd /s/q "!token0!"
	powershell -NoLogo -NoProfile -Command "if (Test-Path -LiteralPath '\\?\!token0!') { Remove-Item -LiteralPath '\\?\!token0!' -Recurse -Force -ErrorAction SilentlyContinue }"

	echo.
	echo ============================================
	echo --- Finish Folder "!token0!"
	echo ============================================
	echo.
)

:STEP2
:: specified files
echo.
echo Backup and Clean Files ...
robocopy "C:\Windows\System32" ".\_backup_\files" "AsusUpdateCheck.exe" /MOV /COPYALL /R:5 /W:5

call :delete_special "C:\Windows\System32\AsusUpdateCheck.exe" yes

robocopy "C:\Windows\System32" ".\_backup_\files" "AsusDownloadAgent.exe" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\System32\AsusDownloadAgent.exe" yes

robocopy "C:\Windows\System32" ".\_backup_\files" "AsusDownLoadLicense.exe" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\System32\AsusDownLoadLicense.exe" yes

robocopy "C:\Windows\System32" ".\_backup_\files" "AsIO2.dll" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\System32\AsIO2.dll" yes

robocopy "C:\Windows\System32" ".\_backup_\files" "AsIO3.dll" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\System32\AsIO3.dll" yes

robocopy "C:\Windows\SysWOW64" ".\_backup_\files\SysWOW64" "AsIO2.dll" /MOE /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\SysWOW64\AsIO2.dll" yes

robocopy "C:\Windows\SysWOW64" ".\_backup_\files\SysWOW64" "AsIO3.dll" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\SysWOW64\AsIO3.dll" yes

robocopy "C:\Windows\System32\drivers" ".\_backup_\files\drivers" "AsIO2.sys" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\System32\drivers\AsIO2.sys" yes

robocopy "C:\Windows\System32\drivers" ".\_backup_\files\drivers" "AsIO3.sys" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\System32\drivers\AsIO3.sys" yes

robocopy "C:\Program Files\ASUS\ARMOURY CRATE Lite Service\MB_Home" ".\_backup_\files" "MB_Home.dll" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Program Files\ASUS\ARMOURY CRATE Lite Service\MB_Home\MB_Home.dll" yes
call :delete_special "C:\Program Files\ASUS\ARMOURY CRATE Lite Service\MB_Home\~MB_Home.dll" yes

robocopy "C:\Windows\System32\drivers" ".\_backup_\files\drivers" "IOMap64.sys" /MOV /COPYALL /R:5 /W:5
call :delete_special "C:\Windows\System32\drivers\IOMap64.sys" yes

:STEP3
:: clean reg 1
SET packagelist="HKCU\Software\ASUS" "HKCU\Software\ASUSTeKcomputer.Inc" "HKLM\Software\ASUS" "HKLM\Software\ASUSTeKcomputer.Inc" "HKLM\SYSTEM\CurrentControlSet\Services\GameSDK Service"
SET packagelist=%packagelist% "HKLM\SYSTEM\CurrentControlSet\Services\AsSysCtrlService" "HKLM\SYSTEM\CurrentControlSet\Services\AsusAppService" "HKLM\SYSTEM\CurrentControlSet\Services\AsusCertService" "HKLM\SYSTEM\CurrentControlSet\Services\AsusFanControlService"
SET packagelist=%packagelist% "HKLM\SYSTEM\CurrentControlSet\Services\Asusgio2" "HKLM\SYSTEM\CurrentControlSet\Services\Asusgio3" "HKLM\SYSTEM\CurrentControlSet\Services\AsusIMESystemService" "HKLM\SYSTEM\CurrentControlSet\Services\ASUSLinkNear"
SET packagelist=%packagelist% "HKLM\SYSTEM\CurrentControlSet\Services\ASUSLinkRemote" "HKLM\SYSTEM\CurrentControlSet\Services\ASUSOptimization" "HKLM\SYSTEM\CurrentControlSet\Services\AsusSAIO" "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSoftwareManager"
SET packagelist=%packagelist% "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSwitch" "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSystemAnalysis" "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSystemDiagnosis" "HKLM\SYSTEM\CurrentControlSet\Services\AsusUpdateCheck"
SET packagelist=%packagelist% "HKLM\SYSTEM\CurrentControlSet\Services\asComSvc" "HKCR\AppID\{57854199-4fbc-4438-87c1-a0e9fa206a33}" "HKLM\SYSTEM\CurrentControlSet\Services\IOMap"
SET packagelist=%packagelist% "HKCR\AppID\{57854199-4fbc-4438-87c1-a0e9fa206a33}" "HKCR\AppID\{833c3b62-9227-11e4-b4a9-0800200c9a66}" "HKCR\AppID\nhAsusStrixlfx.dll" "HKCR\asusac" "HKCR\ASUSGCDriverInitialClient" "HKCR\ASUSGCDriverUpdateClient"
SET packagelist=%packagelist% "HKCR\AsusGCGridServiceSetup" "HKCR\AsusGpuTweak.GpuManager" "HKCR\AsusGpuTweak.GpuManager.1" "HKCR\asusime" "HKCR\asus-support" "HKCR\atkexCom.axdata" "HKCR\atkexCom.axdata.1" "HKCR\CLSID\{0647D986-BD6B-48C9-B496-91E73A06F3BD}"
SET packagelist=%packagelist% "HKCR\CLSID\{1A9482E3-2C71-44DF-9012-A969577325B6}" "HKCR\CLSID\{756E6C18-79CC-3842-9E47-7C80011D303A}" "HKCR\CLSID\{7a661bbd-67f3-5824-1bbe-7a9440cde2f6}\LocalServer32" "HKCR\CLSID\{CA5171D0-95CB-3DA8-A095-A70B39FD6EE0}" "HKCR\Installer\Products\5708DC77B33722F4A9911640E1CAAFAD"
SET packagelist=%packagelist% "HKCR\Interface\{4EBB095F-79F3-4D7A-B068-4151BEC1831C}" "HKCR\TypeLib\{34AAD71E-0356-470C-94B7-593BE46311BB}" "HKCR\TypeLib\{490A72B6-EFC2-4742-A03A-4D5D3878AA5F}" "HKCR\TypeLib\{490A72B6-EFC2-4742-A03A-4D5D3878AA5F}"
SET packagelist=%packagelist% "HKCR\TypeLib\{490A72B6-EFC2-4742-A03A-4D5D3878AA5F}" "HKCR\TypeLib\{57854199-4FBC-4438-87C1-A0E9FA206A33}" "HKCR\TypeLib\{57854199-4FBC-4438-87C1-A0E9FA206A33}" "HKCR\Wow6432Node\AppID\{833c3b62-9227-11e4-b4a9-0800200c9a66}"
SET packagelist=%packagelist% "HKCR\Wow6432Node\AppID\nhAsusStrixlfx.dll" "HKCR\Wow6432Node\CLSID\{01863FDA-20F8-4B21-86E9-CF786BB65A11}" "HKCR\Wow6432Node\CLSID\{24570356-0800-0000-0000-000000000000}" "HKCR\Wow6432Node\CLSID\{2627F8BE-4482-4081-BC62-8A12CA24BDF8}"
SET packagelist=%packagelist% "HKCR\Wow6432Node\CLSID\{419132B2-9160-4A00-B9AF-53A1AAC39979}" "HKCR\Wow6432Node\CLSID\{5E1D4F83-A98E-479D-8885-722BF582D10F}" "HKCR\Wow6432Node\CLSID\{A9B42DD5-AF51-4C7D-8A5D-8170D9D6459F}"
SET packagelist=%packagelist% "HKCR\Wow6432Node\CLSID\{BC50CF2A-E12C-4F18-90CE-714CC8600CEE}" "HKCR\Wow6432Node\CLSID\{C4B81F84-F6AD-48EB-B7FA-018E29F7789E}" "HKCR\Wow6432Node\CLSID\{E9D3416A-9634-452B-8566-365F085102D2}" "HKCR\Wow6432Node\CLSID\{ECE726C5-024B-4141-84CD-58B1C3DBB91B}"
SET packagelist=%packagelist% "HKCR\Wow6432Node\CLSID\{ED16E2E2-25ED-4297-9575-839FF0AF86D6}" "HKCR\Wow6432Node\CLSID\{facea3dd-fc30-43dc-98ba-ac9b32edaf44}" "HKCR\Wow6432Node\Interface\{4EBB095F-79F3-4D7A-B068-4151BEC1831C}"
SET packagelist=%packagelist% "HKCR\Wow6432Node\TypeLib\{34AAD71E-0356-470C-94B7-593BE46311BB}" "HKCR\Wow6432Node\TypeLib\{490A72B6-EFC2-4742-A03A-4D5D3878AA5F}" "HKCR\Wow6432Node\TypeLib\{57854199-4FBC-4438-87C1-A0E9FA206A33}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\AppID\nhAsusStrixlfx.dll" "HKLM\SOFTWARE\Classes\ASUSGCDriverInitialClient" "HKLM\SOFTWARE\Classes\ASUSGCDriverUpdateClient" "HKLM\SOFTWARE\Classes\AsusGCGridServiceSetup" "HKLM\SOFTWARE\Classes\AsusGpuTweak.GpuManager" "HKLM\SOFTWARE\Classes\AsusGpuTweak.GpuManager.1"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\atkexCom.axdata" "HKLM\SOFTWARE\Classes\atkexCom.axdata.1" "HKLM\SOFTWARE\Classes\CLSID\{0647D986-BD6B-48C9-B496-91E73A06F3BD}" "HKLM\SOFTWARE\Classes\CLSID\{1A9482E3-2C71-44DF-9012-A969577325B6}" "HKLM\SOFTWARE\Classes\CLSID\{756E6C18-79CC-3842-9E47-7C80011D303A}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\CLSID\{7a661bbd-67f3-5824-1bbe-7a9440cde2f6}" "HKLM\SOFTWARE\Classes\CLSID\{CA5171D0-95CB-3DA8-A095-A70B39FD6EE0}" "HKLM\SOFTWARE\Classes\CLSID\{CA5171D0-95CB-3DA8-A095-A70B39FD6EE0}" "HKLM\SOFTWARE\Classes\Installer\Products\5708DC77B33722F4A9911640E1CAAFAD"

echo.
echo Backup and Clean Registry 1...
for %%i in (%packagelist%) do (
	SET token=%%i
	SET token0=!token:"=!
	SET token1=!token:"=!
	SET token1=!token1:\=_!
	SET output=!token1!
	echo ============================================
	echo --- Registry 1: !token!
	echo ============================================
	echo.
	reg export "!token0!" ".\_backup_\registry\!output!.reg" /y
	reg delete "!token0!" /f
	echo.
	echo ============================================
	echo --- Finish Registry 1"!token0!"
	echo ============================================
	echo.
)

:STEP4
:: clean reg 2
SET packagelist="HKCU\Software\Classes\asusac" "HKCU\Software\Classes\asusime" "HKCU\Software\Classes\asus-support" "HKCU\Software\Classes\Wow6432Node\CLSID\{24570356-0800-0000-0000-000000000000}\LocalServer32" "HKLM\SOFTWARE\Classes\AppID\{833c3b62-9227-11e4-b4a9-0800200c9a66}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\Interface\{4EBB095F-79F3-4D7A-B068-4151BEC1831C}" "HKLM\SOFTWARE\Classes\TypeLib\{34AAD71E-0356-470C-94B7-593BE46311BB}" "HKLM\SOFTWARE\Classes\TypeLib\{490A72B6-EFC2-4742-A03A-4D5D3878AA5F}" "HKLM\SOFTWARE\Classes\TypeLib\{57854199-4FBC-4438-87C1-A0E9FA206A33}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\{833c3b62-9227-11e4-b4a9-0800200c9a66}" "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\nhAsusStrixlfx.dll" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{01863FDA-20F8-4B21-86E9-CF786BB65A11}" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{2627F8BE-4482-4081-BC62-8A12CA24BDF8}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{419132B2-9160-4A00-B9AF-53A1AAC39979}" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{5E1D4F83-A98E-479D-8885-722BF582D10F}" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{A9B42DD5-AF51-4C7D-8A5D-8170D9D6459F}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{BC50CF2A-E12C-4F18-90CE-714CC8600CEE}" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{C4B81F84-F6AD-48EB-B7FA-018E29F7789E}" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{E9D3416A-9634-452B-8566-365F085102D2}" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{ECE726C5-024B-4141-84CD-58B1C3DBB91B}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{ED16E2E2-25ED-4297-9575-839FF0AF86D6}" "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\{facea3dd-fc30-43dc-98ba-ac9b32edaf44}" "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{4EBB095F-79F3-4D7A-B068-4151BEC1831C}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{34AAD71E-0356-470C-94B7-593BE46311BB}" "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{490A72B6-EFC2-4742-A03A-4D5D3878AA5F}" "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{57854199-4FBC-4438-87C1-A0E9FA206A33}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{57854199-4FBC-4438-87C1-A0E9FA206A33}" "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{605108C1-153E-43D8-8A67-7CE326B00ECA}" "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{77CD8075-733B-4F22-9A19-61041EACFADA}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\ASUS" "HKCU\SOFTWARE\WOW6432Node\ASUS" "HKLM\SOFTWARE\WOW6432Node\ASUSTek Computer Inc." "HKLM\SOFTWARE\WOW6432Node\Classes\AppID\{833c3b62-9227-11e4-b4a9-0800200c9a66}" "HKLM\SOFTWARE\WOW6432Node\Classes\AppID\nhAsusStrixlfx.dll"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{01863FDA-20F8-4B21-86E9-CF786BB65A11}" "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{2627F8BE-4482-4081-BC62-8A12CA24BDF8}" "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{419132B2-9160-4A00-B9AF-53A1AAC39979}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{5E1D4F83-A98E-479D-8885-722BF582D10F}" "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{A9B42DD5-AF51-4C7D-8A5D-8170D9D6459F}" "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{BC50CF2A-E12C-4F18-90CE-714CC8600CEE}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{C4B81F84-F6AD-48EB-B7FA-018E29F7789E}" "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{E9D3416A-9634-452B-8566-365F085102D2}" "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{ECE726C5-024B-4141-84CD-58B1C3DBB91B}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{ED16E2E2-25ED-4297-9575-839FF0AF86D6}" "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\{facea3dd-fc30-43dc-98ba-ac9b32edaf44}" "HKLM\SOFTWARE\WOW6432Node\Classes\Interface\{4EBB095F-79F3-4D7A-B068-4151BEC1831C}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Classes\TypeLib\{34AAD71E-0356-470C-94B7-593BE46311BB}" "HKLM\SOFTWARE\WOW6432Node\Classes\TypeLib\{490A72B6-EFC2-4742-A03A-4D5D3878AA5F}" "HKLM\SOFTWARE\WOW6432Node\Classes\TypeLib\{57854199-4FBC-4438-87C1-A0E9FA206A33}"
SET packagelist=%packagelist% "HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\ASUSProArtUpdateService" "HKLM\SYSTEM\CurrentControlSet\Services\ATKWMIACPIIO"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{06EA142E-8DA4-4917-8AD5-443F483B502D}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{179f415f-2ff3-4db1-bcc1-d5730f746db8}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{1E2EA04B-FCA7-457E-B6F4-F33E1858E859}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2dfe216d-3481-4684-ad4d-2566bd7cfe4f}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{339A6383-7862-46DA-8A9D-E84180EF9424}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{39cdaa93-c446-4421-a337-1e52705dd2f8}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{45ece30d-a966-424e-9bce-f740797c5348}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{4e2b05b0-eb08-41e5-9eb3-cdcc43d6bee0}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{6EE02C78-E908-493B-B1A6-D64AFC53002F}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{7160DA8D-3F25-4F6E-ABC8-F693551D82FA}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{84558862-ba54-4c7a-b3f0-b6d76641d4a0}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{93795eb8-bd86-4d4d-ab27-ff80f9467b37}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{CD36E28B-6023-469A-91E7-049A2874EC13}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{399B6DA7-B609-426E-95F8-B9A83FB7D06E}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{70ABCE41-0F10-4E36-9C93-1AFB1DF2AF42}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{D6B9E727-05B5-46EC-966F-321705D21FD2}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{237E1CAC-1708-4940-AC34-DF15C079AB70}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{2D87BFB6-C184-4A59-9BBE-3E20CE797631}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{399B6DA7-B609-426E-95F8-B9A83FB7D06E}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{4EBEAC95-76BC-46A8-8644-6E2F1C87CF70}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{605108C1-153E-43D8-8A67-7CE326B00ECA}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{6FB66775-BB93-4D0A-9871-4CC9B2E87BF3}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C5A4A164-4428-4931-B728-96EEF0FA3C44}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{CF8E6E00-9C03-4440-81C0-21FACB921A6B}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{EAE80DED-1A39-41C5-9F60-87CC947F6454}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{EF3944FF-2501-4568-B15C-5701E726719E}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{A8761B4B-A179-4469-99B7-FDFA94E551F9}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{359B9A9D-A289-4962-BCE2-13EBFD50D532}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{86D4C8A2-DB22-4948-950D-28DD5145F91C}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{93E38BA3-9745-4D67-91BC-F65F81523D0A}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{BC4DB8AE-8E55-4B06-8656-FB1E4A035A11}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{E980EAD4-0B34-484A-993C-BB6B3852F41C}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Armoury Crate Service"
SET packagelist=%packagelist% "HKCR\Directory\Background\shell\GameLibrary"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{7E5E84CB-B190-4658-A4DC-166779C329D1}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{8714A8D1-0F08-4681-9DF6-A8C4607A58B4}"
SET packagelist=%packagelist% "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run /v ASUS_FRQ_Control"
echo.
echo Backup and Clean Registry 2...
for %%i in (%packagelist%) do (
	SET token=%%i
	SET token0=!token:"=!
	SET token1=!token:"=!
	SET token1=!token1:\=_!
	SET output=!token1!
	echo ============================================
	echo --- Registry 2: !token!
	echo ============================================
	echo.
	reg export "!token0!" ".\_backup_\registry\!output!.reg" /y
	reg delete "!token0!" /f
	echo.
	echo ============================================
	echo --- Finish Registry 2 "!token0!"
	echo ============================================
	echo.
)

:STEP5
:: clean Tasks
echo.
echo Backup and Clean Tasks ...
:: clean specified tasks
schtasks /delete /TN "ASUS Optimization 36D18D69AFC3" /F
schtasks /delete /TN "ASUSProArtUpdateService-Logon" /F
schtasks /delete /TN "ArmourySocketServer" /F

:: clean ASUS task folder
echo.
echo Clean ASUS Tasks ...
FOR /F "tokens=3 delims=\" %%G IN ('schtasks /Query /FO LIST ^| findstr ASUS') DO schtasks /Delete /TN "\ASUS\%%G" /F

:STEP6
:: remove ArmouryCrate App
echo.
echo Remove ArmouryCrate App again ...
powershell.exe -Command "Get-AppxPackage *ArmouryCrate* -allusers | Remove-AppPackage"

:STEP7
:: remove all other ASUS Apps
echo.
echo "Do you want to remove all applications with the word "ASUS" from your system?"
echo "*** WARNING ***"
echo "There is a possibility that other applications may be deleted by mistake!"
echo.
echo ============================================
powershell -Command "$i = 1; Get-AppPackage -AllUsers *ASUS* | ForEach-Object {Write-Output (\"$i. \" + $_.Name); $i++}"
echo ============================================
echo.
echo "Please double check if all the apps listed above are the ones you want to delete!"
echo "*** WARNING ***"
echo "Are you sure you want to remove these apps?"
choice /C YN /N /M "Select (Y/N): "
if errorlevel 2 goto STEP8
powershell.exe -Command "Get-AppxPackage *ASUS* -allusers | Remove-AppPackage"

:STEP8
:: clean specified folders
echo.
echo remove specified folders ...
set "P1=C:\Windows\SysWOW64\config\systemprofile\AppData\Roaming\asus_framework"
set "P2=C:\Windows\System32\config\systemprofile\AppData\Roaming\asus_framework"

for %%P in ("%P1%" "%P2%") do (
  if exist "%%~P" (
    echo Removing %%~P ...
    attrib -r -h -s "\\?\%%~P" /s /d 2>nul
    takeown /f "%%~P" /r /d y >nul
    icacls "%%~P" /grant administrators:F /t >nul
    powershell -NoLogo -NoProfile -Command "Remove-Item -LiteralPath '\\?\%%~P' -Recurse -Force -ErrorAction SilentlyContinue"
    echo Done.
  ) else (
    echo [Skip] Not found: %%~P
  )
)

:STEP9
:: remove Temp files
echo clean temp folders ...
del /s /q /f %SystemRoot%\Temp\*.*
del /s /q /f %temp%\*.*
del /s /q /f %USERPROFILE%\AppData\Local\Temp\*.*

:FINAL_STEP
echo.
echo "All ASUS data has been backed up to the _backup_. Clean ASUS is done!"
echo.
goto ENDPROG
goto :eof

:: implement functions delete_special
:delete_special <input> <register_for_deletion>
	setlocal EnableDelayedExpansion
	takeown /F "%~1" >nul 2>&1
	icacls "%~1" /grant %USERNAME%:F >nul 2>&1
	del "%~1" >nul 2>&1
	if "%~2" equ "yes" (
		call :register_pending_delete "%~1"
	)
	endlocal
	exit /b

:: implement functions register_pending_deletes
:register_pending_delete <file_to_delete>
	powershell.exe -Command "& {Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Utils { [DllImport(\"kernel32.dll\", SetLastError=true, CharSet=CharSet.Auto)] public static extern bool MoveFileEx(string lpExistingFileName, uint lpNewFileName, uint dwFlags); }'; [Utils]::MoveFileEx('%~1', 0, 0x4);}"
	goto :eof

:ENDPROG
