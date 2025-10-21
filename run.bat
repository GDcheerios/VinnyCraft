@echo off
title VinnyCraft

set "serverURL=https://mohistmc.com/api/v2/projects/mohist/versions/1.20.1/builds/latest/download"
set "PPURL=https://github.com/GDcheerios/PointPlugin/releases/download/v0.0.1/PointPlugin-1.0-SNAPSHOT.jar"
set "MVIURL=https://cdn.modrinth.com/data/qvdtDX3s/versions/MeYBNg6N/multiverse-inventories-5.2.0.jar"
set "MVCURL=https://cdn.modrinth.com/data/3wmN97b8/versions/K4FBldrK/multiverse-core-5.3.3.jar"

set "serverOUT=server.jar"
set "PPOUT=plugins\PointPlugin.jar"
set "MVIOUT=plugins\multiverse-inventory.jar"
set "MVCOUT=plugins\multiverse-core.jar"

echo Checking for required files...
if not exist "plugins" (
    echo Creating plugins folder...
    mkdir "plugins"
)

if not exist "%serverOUT%" (
    echo Downloading server.jar...
    curl --fail --location --output "%serverOUT%" "%serverURL%"
)

if not exist "%PPOUT%" (
    echo Downloading PointPlugin.jar...
    curl --fail --location --output "%PPOUT%" "%PPURL%"
)

if not exist "%MVIOUT%" (
    echo Downloading multiverse-inventory.jar...
    curl --fail --location --output "%MVIOUT%" "%MVIURL%"
)

if not exist "%MVCOUT%" (
    echo Downloading multiverse-core.jar...
    curl --fail --location --output "%MVCOUT%" "%MVCURL%"
)

echo.
echo Starting server...
java -Xms8G -Xmx12G -jar "%serverOUT%" nogui

pause
