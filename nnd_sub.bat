@echo off
::[Net Novel Downloadr] NND＿SUB
set SUB_VER=0.01
set NND_VER=0.03
set P1=%1
set S[1]=http://users.ugent.be/~bpuype/cgi-bin/fetch.pl?dl=wget/wget.exe
set S[2]=http://ftp.jaist.ac.jp/pub/sourceforge/u/un/unigw/unzip/5.50/unzip.exe
set S[3]=
set M[1]=https://github.com/cqw25116/ncode/blob/master/filez/wget.exe
set M[2]=https://github.com/cqw25116/ncode/blob/master/filez/unzip.exe
set M[3]=
pushd %0\..


setlocal ENABLEDELAYEDEXPANSION

:: wget.exe file check [./] ^& PATH
:: %HomeDrive% Full check =^>      dir /a/b/s %HomeDrive%wget.exe
::set KEY=wget.exe
::if not EXIST %KEY% (
::    for %%A in (%KEY%) do set WF=%%~$PATH:A
::    for /f %%B in ('echo !WF! ^| find /c "%KEY%"') do if "%%B"=="0" call :WGET_DL)
::set KEY=unzip.exe
::if not EXIST %KEY% (
::  for %%A in (%KEY%) do set WF=%%~$PATH:A
::  for /f %%B in ('echo !WF! ^| find /c "%KEY%"') do if "%%B"=="0" call :UNZIP_DL)
::pause

:START
if "%P1%"=="" goto :HELP

if "%P1:~1,1%"=="h" goto :NND_HELP
if "%P1:~1,1%"=="H" goto :NND_HELP

if "%P1:~1,2%"=="d1" goto :DL
if "%P1:~1,2%"=="D1" goto :DL

if "%P1:~1,2%"=="o1" goto :OW1
if "%P1:~1,2%"=="O1" goto :OW1

if "%P1:~1,2%"=="o2" goto :OW2
if "%P1:~1,2%"=="O2" goto :OW2


:goto END

:HELP
@echo [Net Novel Downloadr] NND_SUB: %SUB_VER%
@echo.
@echo  NND_SUB[-D(1:2)] [-OW(1:2)] [-H]
@echo.
@echo    -D1 Sub Program Download (Current directory ^& PATH Check)
@echo    -D2 Sub Program Download (Current directory ^& PATH Check) [My GitHub]
@echo.
@echo    -O1 Sub Program Download (Force Download)
@echo    -O2 Sub Program Download (Force Download) [My GitHub]
@echo.
@echo    -H NND Help
goto :END

:NND_HELP
@echo [Net Novel Downloadr] NND: %NND_VER%  {http^://ncode.syosetu.com/}
@echo.
@echo  NND [^%%1^<=ncode] [^%%2^<=Subtitle No] [-L] [-H] [-O] [-T] [-C] [-S]
@echo.
@echo   -H Help                              -S Sample Config File Output
@echo   -O output Folder                     -C Config File Loading Mode
@echo   -L Subtitle List Output =^> [ncode]_list.txt
@echo   -T FILE NAME is =^> [ncode]_[Subtitle No]_[1st draft]_[update].txt
@echo.
@echo   Ex. ncode =^> n12345     NND n12345 A        Novels FUll Downlaods
@echo   Ex.                     NND n12345 5        Epsode 5 only Downlaod
@echo   Ex.                     NND n12345 1-5      Epsode 1~5    Downlaods
@echo   Ex.                     NND n12345 1,3,5    Epsode 1,3,5  Downlaods
@echo.
@echo   Ex. NND n12345 1,5 -L   =^> .\n12345\n12345_list.txt
@echo                           =^> .\n12345\n12345_0001.txt
@echo                           =^> .\n12345\n12345_0005.txt
@echo.
@echo   Ex. NND n12345 101 -T -O\syosetu\yomou
@echo           =^> .\syosetu\yomou\n12345\n12345_0101_20140701_20141001.txt
goto :END

:WGET_DL
  if not EXIST wget.exe cscript //nologo httpget.vbs "%WGET_URL_1%"
  if not EXIST wget.exe cscript //nologo httpget.vbs "%WGET_URL_2%"
  if not EXIST wget.exe cscript //nologo httpget.vbs "%WGET_URL_3%"
  if EXIST wget.exe @echo WGET  DL ...
exit /b

:UNZIP_DL
  if not EXIST unzip wget -q "%UNZIP_URL_1%"
  if not EXIST unzip wget -q "%UNZIP_URL_2%"
  if EXIST unzip.exe @echo UNZIP DL ...
exit /b

:OW1
  cscript //nologo httpget.vbs %S[1]%
  wget -q -N "%S[2]%"
goto :END
:OW2
  cscript //nologo httpget.vbs %M[1]%
  wget -q -N "%M[2]%"
goto :END

:OWdd2
  cscript //nologo httpget.vbs %S[1]%
  if not EXIST wget.exe cscript //nologo httpget.vbs %O[1]%
  if EXIST wget.exe @echo WGET  foece DL ...
  wget -q -N "%S[2]%"
  if not EXIST unzip.exe wget -q -N "%O[2]%"
  if EXIST unzip.exe @echo UNZIP foece DL ...
goto :END

:END
