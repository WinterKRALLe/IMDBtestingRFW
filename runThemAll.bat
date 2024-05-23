@echo off

for /d %%d in ("tests\*") do (
    set "parent_folder=%%~nxd"
    if not exist "results\%%~nxd" mkdir "results\%%~nxd"
    robot --outputdir "results\%%~nxd" "%%d\*.robot"
)