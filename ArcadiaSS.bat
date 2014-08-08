:: ----------------------------------------------------------------------------
:: [Net Novel Downloader]  NND    [Arcadia SS Board]mode
:: ----------------------------------------------------------------------------
@echo off
@echo [Net Novel Downloader]  NND    [Arcadia SS Board] mode
@echo.
::
set ALL_FLAG=on
set ALL_START=1
set ALL_END=162
::
set XXX_FLAG=on
set XXX_START=1
::set XXX_END=10  ::←通常は使わない
::

:: 一覧：：元作品（ジャンル別・フルダウンロード）
type nul > Arcadia_list_J.csv
type nul > Arcadia_list_A.csv
type nul > cake.no

:ALL_LIST
:: 一覧作成①（掲示板：全て】から抽出）
if "%ALL_FLAG%" == "on" (
for /l %%a in (%ALL_START%,1,%ALL_END%) do (
    wget -q -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=%%a"| grep -n "act=dump" |nkf|sed -e "s/,/，/g" -e "s/\""/”/g" |sed -e "s/\&amp;/\＆/g" -e "s/\&lt;/＜/g" -e "s/\&gt;/＞/g" -e "s/\&quot;/“ /g" -e "s/nowrap/\>,\</g" -e "s/<[^>]*>//g" -e "s/>//g"|nkf|cut -d, -f2-9|sed -e "s/--/,/"  >> Arcadia_list_A.csv
    @echo Making List File ...... Download Arcadia BBS Board [ALL] -%%a- ) )
if "%XXX_FLAG%" == "on" (
  for %%a in (18) do (
    wget -q -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=%%a" |grep "SS-BBS SCRIPT"|nkf|sed -e "s/<[^>]*>//g" |cut -d"|" -f2|cut -d"/" -f2|sed -e "s/ //g" >cake.no
      set /P XXX_END=<cake.no
        for /l %%b in (%XXX_START%,1,%XXX_END%) do (
          wget -q -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=%%a&page=%%b"|nkf| grep -n "act=dump" |sed -e "s/,/，/g" -e "s/nowrap/\>,\</g" -e "s/<[^>]*>//g" -e "s/>//g"|nkf|cut -d, -f2-9|sed -e "s/--/,/" | sed "s/^/%%a,/g" |sed -e "s/^18/ＸＸＸ/" >>Arcadia_list_A.csv
          @echo Making List File ...... Download Arcadia BBS Board [%%a] -%%b- )  )  
)
goto :end
::GENRE_LIST
:: --------------------------------------------------------------------------
:: 一覧作成②：：ジャンル別（手間の割に・・・・　一覧作成①を使いましょう）
for %%a in (eva nade akamatu type-moon muv-luv ff sammon toraha gs naruto zero HxH original etc 18) do (
    wget -q -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=%%a" |grep "SS-BBS SCRIPT"|nkf|sed -e "s/<[^>]*>//g" |cut -d"|" -f2|cut -d"/" -f2|sed -e "s/ //g" >cake.no
      set /P NO=<cake.no
      for /l %%b in (1,1,%NO%) do (
         wget -q -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=%%a&page=%%b"| grep -n "act=dump" |sed -e "s/,/，/g" -e "s/nowrap/\>,\</g" -e "s/<[^>]*>//g" -e "s/>//g"|nkf|cut -d, -f2-9|sed -e "s/--/,/" | sed "s/^/%%a,/g"  |sed -e "s/^eva/エヴァ/" -e "s/^nade/ナデシコ/" -e "s/^akamatu/赤松健/" -e "s/^type-moon/TYPE-MOON/" -e "s/^muv-luv/Muv-Luv/" -e "s/^ff/スクエニ/" -e "s/^sammon/サモンナイト/" -e "s/^toraha/とらハ/" -e "s/^gs/椎名高志/" -e "s/^naruto/ナルト/" -e "s/^zero/ゼロ魔/" -e "s/^HxH/HxH/" -e "s/^original/オリジナル/" -e "s/^etc/その他/" -e "s/^18/ＸＸＸ/" |grep -v "01\/01 09:00">>Arcadia_list_J.csv
        @echo Making List File ...... Download Arcadia BBS Board [%%a] -%%b- ) 
)
goto :end








goto :end

:: ----------------------------------------------------------------------------
if not "%1"=="" (set SScode=%1) else (@echo      ^>^> NND [Arcadia SS Board] .....  not found [^%%1]  ERR ^!  & echo. & goto :end)
::IF not EXIST SS-TMP-0000 del SS-TMP-*
::del SS*.txt
::http://www.mai-net.net/bbs/sst/sst.php?act=dump&all=38857
:: ----------------------------------------------------------------------------
set URL_ALL=http:^/^/www.mai-net.net^/bbs^/sst^/sst.php^?act=all_msg^&cate=all^&all=
set URL_TOP=http:^/^/www.mai-net.net^/bbs^/sst^/sst.php^?act=dump^&all=
set T=%TMP%\NOVEL\

IF not EXIST .\syosetu\ (mkdir .\syosetu)
if "%1"=="LM" goto :LIST_Maker
if "%1"=="lm" goto :LIST_Maker
　
SETLOCAL ENABLEDELAYEDEXPANSION




goto :end
wget -q -O - "%URL_ALL%%SScode%"|nkf> html.txt
grep "Date: " html.txt|cut -c79- >body.txt
grep "bgb" html.txt|tr "[]" "<>"|sed -e "s/<[^>]*>//g" -e "s/^ *//g" >subtitle.txt
grep "bgb" html.txt|sed -e "s/<[^>]*>//g" | grep -n "" |nkf|grep "^1:"|cut -d: -f2|sed -e "s/^ *//">title.txt
grep "Name:" html.txt | sed -e "s/<[^>]*>//g"|cut -d":" -f2- >name.txt

::grep "Name:" html.txt | sed -e "s/<[^>]*>//g" -e "s/◆/:/g" -e "s/ID//g" -e "s/:/,/g" | cut -d"," -f3- >name.txt
::grep "bgb" html.txt|sed -e "s/<[^>]*>//g"|sed -e "s/$/ \<br\>/"|sed "s/^/%TITLE%\<br\>\<br\>/g">subtitle.txt


    for /f %%i in ('grep -c "" body.txt') do set ss1=%%i
    for /f %%i in ('grep -c "" subtitle.txt') do set ss2=%%i
    if !ss1!==!ss2! (goto :good) else (goto :bad)

goto :END
::同じ文字列を繰り返し表示するコマンド （連番ファイル風）:: seq -f "Hello_%02g.txt" 10 
:: 同じ文字を１０回くりかえして表示する　:: seq -f "Hello,%g" 10 | cut -f1 -d,   
:: ----------------------------------------------------------------------------
:good
  ::file csplit -b%%04d = csplit --suffix%%04d  ---- %%
    paste subtitle.txt name.txt body.txt  |grep -n "" |sed -e "s/\<br\>/\r\n/g"|sed -e "s/<[^>]*>//g"|tr -d "<>" >text.txt
    csplit -z -s -fSS-TMP- -b%%04d html.txt /^[0-9]:/ {*}
     ::［作品コード］｛最終話数｝作品タイトル の表示　　【echoの代わりに標準出力を使う】
grep "^1:" SS-TMP-0000|cut -d: -f2|sed -e "s/^ *//" -e "s/]/] {!ss1!}/"|nkf -Lw
goto :END

:LIST_maker
set URL="http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1"
set URL="http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=2"
wget -q -O - %URL% | grep -F "act=dump" | sed -e "s/nowrap/>,</g" -e "s/>>/>/g" -e "s/<[^>]*>//g" -e "s/--/,/g" | cut -d, -f2-9 | grep -v "Scratched by" | nkf -w -Lw | tee csv1.csv | cut -d, -f2 > List1.dat
wget -q -O - %URL% | grep -F "act=dump" | sed -e "s/nowrap/>\</g"  -e "s/>>/>/g"-e "s/<[^>]*>//g" -e "s/--/,/g" | cut -d, -f2-9 | grep -v "Scratched by" | nkf -w -Lw | tee csv2.csv | cut -d, -f2 > List2.dat
@echo      ^>^> NND [Arcadia SS Board] .....  List-DATA List-CSV  Maked .....  OK ^! & echo.
goto :end

:: ----------------------------------------------------------------------------
:LIST_maker_Auto



goto :end

:: ----------------------------------------------------------------------------
:bad
    @echo err:err:err
:: ----------------------------------------------------------------------------

::@echo TITLE:%title%
:: ----------------------------------------------------------------------------
:: ----------------------------------------------------------------------------
::  MEMO ===============================
**sed -n -e "s!.*<p class=\""novel_subtitle\"">\(.*\)</p>.*!\1!p"


:: SS1
:: 最大ページ数取得
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | grep -F "allow" |sed -e "s/<[^>]*>//g" |tr "|/" ",,"|cut -d, -f3|nkf
::
:: SSコード入手
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | sed -e "s/<[^>]*>//g" | grep -F ":" | tr ">" "," | cut -d"," -f1| grep -o -e [0-9]\+\-| tr -d "-"
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | grep -v "script"|sed -e "s/<[^>]*>//g" | grep -o -e [0-9]\+\-|tr -d -|nkf
::39302
::<form name=  
:: SS CSV List              SS-BBS SCRIPT for CONTRIBUTION  sed -e "s/^.*(\(.*\)).*$/\1/"
wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | nkf|grep -F "act=dump" |sed -e "s/--/,/g" >csv.csv
::|sed -e "s/<[^>]*>//g" |cut -d, -f2-9|nkf >csv.csv
::
)
::wget -O - "http://www.mai-net.net/bbs/sst/sst.php?act=list&cate=all&page=1" | grep -n "act=dump" |sed -e "s/nowrap/\>,\</g" -e "s/<[^>]*>//g" -e "s/--/,/g" -e "s/>//g"|cut -d, -f2-9|nkf >csv.csv


::オリジナル,38619,樹治名将言行録　～鐘山環伝～【戦国時代風ファンタジー】（旧名：樹......,瀬戸内弁慶,70,23,41630,08/02 23:58
::オリジナル,38163,開扉の獅子　【扉が切り開く異界冒険譚】,数札霜月,35,13,8887,08/02 23:47
::その他,39576,ガンダムビルドファイターズ　White&Black,ケンヤ,44,81,24456,08/02 22:06

::http:^/^/www.mai-net.net^/bbs^/sst^/sst.php^?act=dump^&cate=all^&all=7277^&n=0^&count=1
:: ----------------------------------------------------------------------------
::paste--- LF  (Windows---LF+CR)
:: ----------------------------------------------------------------------------

wget -q -O - "%URL_TOP%%SScode%"|nkf|nkf|tee list.txt|grep "n=[0-9]#kiji"|grep "<td width">aaaa.txt

::type aaaa.txt|nkf|cut -d"=" -f6-10|sed -e "s/=/>=</g" -e "s/#/=</g" -e "s/$/>/" -e "s/<[^>]*>//g" -e "s/==/=/g" -e "s/=/,/g" -e "s/(//g" -e "s/)//g">aaa.txt
::type aaaa.txt|nkf|sed -e "s/<[^>]*>//g" -e "s/\#/=/g" >aaa.txt
::(writer)
type aaaa.txt|nkf|sed -e "s/<\/a>/=/g" -e "s/#/=</g"  |cut -d"=" -f6-10|sed -e "s/<kiji\"">//g"|nkf -w -Lw|tee bbb.txt|sed -e "s/^.*\[\(.*\)\].*$/\1/" > aaa.txt
type bbb.txt|cut -d"=" -f1,2|nkf -s -Lw

:: (date time)
type aaaa.txt|nkf|sed -e "s/^.*(\(.*\)).*$/\1/"
type aaaa.txt|nkf|sed -e "s/^.*\[\(.*\)\].*$/\1/"

::type aaaa.txt|nkf|sed -n -e "s!.*kiji\""\>\(.*\)\<\/a\>\<\/b\>\<\/td\>.*!\1!p"
::type aaaa.txt|nkf|sed -n -e "s!.*font-size:60%\"">\(.*\)</td>.*!\1!p"
::type aaaa.txt|nkf|sed -n -e "s!.*font-size:60%"">\(.*\)</td>.*!\2!p"
::type aaaa.txt|nkf|sed -n -e "s!.*font-size:60%"">\(.*\)</td>.*!\3!p"




goto :end

:END