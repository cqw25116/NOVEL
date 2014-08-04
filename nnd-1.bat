@echo off
::cls
::[Net Novel Downloadr] NND
set VER=0.02

pushd %0\..
set n=.\Novel
::set s=..\DL
set P0=%0
set P1=%1
set P2=%2
set P3=%3
set P4=%4
set P5=%5
set P6=%6
set P7=%7
set P8=%8
set P9=%9
set WGET_URL_1=http://users.ugent.be/~bpuype/cgi-bin/fetch.pl?dl=wget/wget.exe
set WGET_URL_2=https://github.com/cqw25116/ncode/blob/master/filez/wget.exe
set UNZIP_URL=http://ftp.jaist.ac.jp/pub/sourceforge/u/un/unigw/unzip/5.50/unzip.exe

setlocal ENABLEDELAYEDEXPANSION

:: wget.exe file check [./] ^& PATH
:: %HomeDrive% Full check =^>      dir /a/b/s %HomeDrive%wget.exe
set KEY=wget.exe
if not EXIST %KEY% (
    for %%A in (%KEY%) do set WF=%%~$PATH:A
    for /f %%B in ('echo !WF! ^| find /c "%KEY%"') do if "%%B"=="0" call :WGET_DL)
set KEY=unzip.exe
if not EXIST %KEY% (
  for %%A in (%KEY%) do set WF=%%~$PATH:A
  for /f %%B in ('echo !WF! ^| find /c "%KEY%"') do if "%%B"=="0" goto :UNZIP_DL)

:START
if "%P1%"=="" goto :HELP
if "%P1:~1,1%"=="s" goto :AUTO
if "%P1:~1,1%"=="S" goto :AUTO
if "%P1:~1,1%"=="v" goto :VER
if "%P1:~1,1%"=="V" goto :VER
if "%P1:~1,1%"=="w" goto :WGET_DL_2
if "%P1:~1,1%"=="W" goto :WGET_DL_2


:goto END
:HELP
  @echo [Net Novel Downloadr] NND: %VER%  {http^://ncode.syosetu.com/}
  @echo.
  @echo  NND [^%%1^<=ncode] [^%%2^<=Subtitle No] [-L] [-H] [-O] [-T] [-C] [-S]
  @echo.
::@echo 00000000011111111112222222222333333333344444444445555555555666666666
::@echo 123456789012345678901234567890123456789012345678901234567890123456789
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
:AUTO
  @echo AUTO MODE
  goto :END
:VER
  @echo [Net Novel Downloadr] NND: %VER%
  goto :END
:WGET_DL
:: WGET Download (+httpget.vbs)
@echo WGET file not found of [./] ^& PATH
if not EXIST wget.exe (cscript //nologo httpget.vbs "%WGET_URL_1%"
  if EXIST wget.exe (@echo WGET DL=^>1:[%WGET_URL_1%] & @echo READY NND [Net Novel Downloadr]...))
if not EXIST wget.exe (cscript  //nologo httpget.vbs "%WGET_URL_2%"
  if EXIST wget.exe (@echo WGET DL=^>2:[%WGET_URL_2%] & @echo READY NND [Net Novel Downloadr]...))
if not EXIST wget.exe (cscript  //nologo httpget.vbs "%WGET_URL_3%"
  if EXIST wget.exe (@echo WGET DL=^>3:[%WGET_URL_3%] & @echo READY NND [Net Novel Downloadr]...))
exit /b
:WGET_DL_2
  cscript //nologo httpget.vbs "%WGET_URL_1%"
  if not EXIST wget.exe cscript //nologo httpget.vbs "%WGET_URL_2%"
  if not EXIST wget.exe cscript //nologo httpget.vbs "%WGET_URL_3%"
  if EXIST wget.exe @echo WGET  foece DL ...
  wget -q -N "%UNZIP_URL%"
  if EXIST unzip.exe @echo UNZIP foece DL ...

goto :END
:UNZIP_DL
   wget -q "%UNZIP_URL%"
   if EXIST unzip.exe (@echo UNZIP DL=^>1:[%UNZIP_URL%])

:END
