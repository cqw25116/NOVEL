:: サーバー１（本家）
set S1[1]=http://users.ugent.be/~bpuype/cgi-bin/fetch.pl?dl=wget/wget.exe
set S1[2]=http://sevenzip.sourceforge.jp/howto/9.20/7z.exe
set S1[3]=http://sevenzip.sourceforge.jp/howto/9.20/7z.dll
set S1[4]=http://downloads.sourceforge.net/project/unxutils/unxutils/current/UnxUtils.zip
set S1[5]=http://unxutils.sourceforge.net/UnxUpdates.zip
set S1[6]=http://barutan.s296.xrea.com/nocache/nkf-2.1.3-win.zip
set S1[7]=https://github.com/peco/peco/releases/download/v0.2.2/peco_windows_386.zip
:: サーバー２　（ミラーリング　by.kawa[dropbox]）
set S2[1]=https://www.dropbox.com/s/4y9yhb3c7z0xnjm/wget.exe?dl=1
set S2[2]=https://www.dropbox.com/s/ncdcxde7ip9gl3g/7z.exe?dl=1
set S2[3]=https://www.dropbox.com/s/6wtt6y2jkkkcgnw/7z.dll?dl=1
set S2[4]=https://www.dropbox.com/s/sjp9i4a5m6q9etz/UnxUtils.zip?dl=1
set S2[5]=https://www.dropbox.com/s/0mji6glro06jfj2/UnxUpdates.zip?dl=1
set S2[6]=https://www.dropbox.com/s/95cip38x89792lc/nkf-2.1.3-win.zip?dl=1
set S2[7]=https://www.dropbox.com/s/13cwow6pzuatath/peco_windows_386.zip?dl=1
:: 　7-zip　解凍オープション
set Z[1]=
set Z[2]=
set Z[3]=
set Z[4]=
set Z[5]=
set Z[6]=
set Z[7]=
::　各種フォルダ　T=TMP B=BIN-PATH
::  小説サイト　　S1=小説を読もう！ S2=Arcadia(SS掲示板)
set T=%TMP%\NOVEL\
set B=.\BIN\
set S1=.\SYOSETU\ncode\
set S2=.\SYOSETU\Arcadia\
