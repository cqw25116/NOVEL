:: ----------------------------------------------------------------------------
:: [Net Novel Downloader]  NND    [Arcadia SS Board]
:: ----------------------------------------------------------------------------
@echo off
@echo [Net Novel Downloader]  NND    [Arcadia SS Board]
@echo.

:: ----------------------------------------------------------------------------

del SS-TMP-*
del SS*.txt
IF not EXIST .\syosetu\ (mkdir .\syosetu)
:: ----------------------------------------------------------------------------

::http:^/^/www.mai-net.net^/bbs^/sst^/sst.php^?act=dump^&cate=all^&all=7277^&n=0^&count=1
set URL_FULL=http:^/^/www.mai-net.net^/bbs^/sst^/sst.php^?act=all_msg^&cate=all^&all=

set T=%TMP%\NOVEL\
SETLOCAL ENABLEDELAYEDEXPANSION

::set SScode=40104
    if not "%1"=="" (set SScode=%1) else (set SScode=40104)

:: ----------------------------------------------------------------------------
::paste--- LF  (Windows---LF+CR)
::nkf -w -Lu (UTF8 +LF)
wget -q -O - "%URL_FULL%%SScode%"|nkf -w -Lu >ss.txt
    grep "Date: " ss.txt|cut -c79->ss1.txt
    grep "bgb" ss.txt|sed -e "s/<[^>]*>//g"|sed -e "s/$/ \<br\>\<br\>/">ss2.txt
::    wget -q -O - "%URL%%SScode%"|nkf -w -Lu |tee ss.txt|grep "Date: " |cut -c79->ss1.txt
::    grep "bgb" ss.txt|sed -e "s/<[^>]*>//g"|sed -e "s/$/ \<br\>\<br\>/">ss2.txt
        for /f %%i in ('grep -c "" ss1.txt') do set ss1=%%i
        for /f %%i in ('grep -c "" ss2.txt') do set ss2=%%i
          if !ss1!==!ss2! (goto :good) else (goto :bad)

:: ----------------------------------------------------------------------------
:good
  ::file csplit -b%%04d = csplit --suffix%%04d  ---- %%
    paste ss2.txt ss1.txt  |grep -n "" |sed -e "s/\<br\>/\r\n/g"|sed -e "s/<[^>]*>//g"|tr -d "<>" >ss.txt
    csplit -z -s -fSS-TMP- -b%%04d ss.txt /^[0-9]:/ {*}
    ::［作品コード］｛最終話数｝作品タイトル の表示　　【echoの代わりに標準出力を使う】
    grep "^1:" SS-TMP-0000|cut -d: -f2|sed -e "s/^ *//" -e "s/]/] {!ss1!}/"|nkf -Lw
goto :END

:: ----------------------------------------------------------------------------
:bad
    @echo err:err:err

:: ----------------------------------------------------------------------------
:END

:: ----------------------------------------------------------------------------
:: ----------------------------------------------------------------------------
:: SS1
:: 最大ページ数取得
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | grep -F "allow" |sed -e "s/<[^>]*>//g" |tr "|/" ",,"|cut -d, -f3|nkf
::
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | sed -e "s/<[^>]*>//g" | grep -F ":" | tr ">" "," | cut -d"," -f1| grep -o -e [0-9]\+\-| tr -d "-"
::
:: SSコード入手
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | grep -v "script"|sed -e "s/<[^>]*>//g" | grep -o -e [0-9]\+\-|tr -d -|nkf
::39302
::
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | sed -e "s/nowrap/\>,\</g" -e "s/<[^>]*>//g" -e "s/--/,/g"|nkf|tr -d ">"|cut -d, -f2,5,8
::その他,39302,IS ～across the sky～　（チラ裏から転移）,シャオフェイ,17,2,19736,08/02 00:27
