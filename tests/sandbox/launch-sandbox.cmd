@echo off
:: Dynamically generates a .wsb config with the correct repo path, then launches Windows Sandbox.
:: Usage: just double-click this file (or run from terminal).
setlocal

:: Resolve repo root (this script is at tests/sandbox/, so go up two levels)
set "REPO=%~dp0..\.."
for %%I in ("%REPO%") do set "REPO=%%~fI"

:: Ensure results folder exists
if not exist "%REPO%\tests\sandbox\results" mkdir "%REPO%\tests\sandbox\results"

:: Generate .wsb file
set "WSB=%~dp0_generated.wsb"

(
echo ^<Configuration^>
echo   ^<MappedFolders^>
echo     ^<MappedFolder^>
echo       ^<HostFolder^>%REPO%^</HostFolder^>
echo       ^<SandboxFolder^>C:\deepclean-cmd^</SandboxFolder^>
echo       ^<ReadOnly^>false^</ReadOnly^>
echo     ^</MappedFolder^>
echo     ^<MappedFolder^>
echo       ^<HostFolder^>%REPO%\tests\sandbox\results^</HostFolder^>
echo       ^<SandboxFolder^>C:\results^</SandboxFolder^>
echo       ^<ReadOnly^>false^</ReadOnly^>
echo     ^</MappedFolder^>
echo   ^</MappedFolders^>
echo   ^<MemoryInMB^>4096^</MemoryInMB^>
echo   ^<Networking^>Disable^</Networking^>
echo ^</Configuration^>
) > "%WSB%"

echo Launching Windows Sandbox with repo: %REPO%
start "" "%WSB%"
endlocal
