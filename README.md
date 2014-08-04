##『小説を読もう！』他、オンライン小説　ダウンローダー
####　　　CMD(win)＋batch＋Linux系コマンド
-**
　wgetでhemlファイルをDLし、余分なタグ、情報を削除して単純なテキストファイルとして保存。
HPの構造変化にできるだけ簡単に対応できるように設計する。

　『小説を読もう！』の新規、追加に対応したダウンローダーは過去に動作確認済みである
が、HPの構造が変わってから対応させるのが面倒になり、改めて、作り直す事にした。
過去のアルファ版は、vbscript+wget。ベーターがバッチ＋Linux系コマンドで開発。今回こそは正式版としたい。
**DL部分はwgetに丸投なので、それなりに高速に動作します**


**　所詮バッチファイルなのですが、最終的にexe化して敷居を少し低くして公開しょうかと思います。**

####開発の予定
**１）必要なファイルのDL**　(**1-4** までは出来ている)
- 動作に必要なLinux系コマンドをDLするバッチの用意。
- 所定のフォルダーへ解凍して、PATHを切る
- **UnxUtils + Update , NKF , Peco** 等
- 問題は、ファイルの有無のチェックをどこまで厳密に行うか？
- WEBの構造を調べて、ファイルのURLを取り出してDLすることも出来るが、『卵と鶏』の問題があり・・・・

- **正式版へ向けての手順・改良点等**
 - 1） httpget.vbs で **wget** を **DL**。
 - 2） **7zip howto** から **7zip** と **DLL** のコマンドライン版を **DL** する.
 - 3） UnxUtiles Update を先にDLする。これで **zip** に圧縮された**SED **と **Grep** が手にはいる。
 - 4)  バッチファイルにDL用リストを埋め込んでおく。
 - 5） 上記リストURLのでファイル確認が出来なかった場合、URLをhtmlから解析しながら逐次wgetでDLする。
 - 6)  ここの部分は、あまり無気になってがんばっても意味がないので、ほどほどで・・・・
-**

**２）簡単な動作確認**　(**1-3** までは出来ている)
- 『小説を読もう！』の希望する小説のncodeを指定してDLする。
- 単純にDLするだけなので、ほとんど解析するぶぶんが無い。

 - 1) s_get.bat ncode 　⇒その小説の全話をDL  
 - 2) s_get.bat ncode 0 　⇒その小説のサブタイトルの一覧をDL
 - 3) s_get.bat ncode 3 　⇒その小説の指定した１話をDL
 - 4) s_get.bat ncode 5-100 　⇒その小説の連続した数話をDL
 - 5) s_get.bat ncode 5,7,9　 ⇒その小説の不連続した数話をDL
-**

**３）巡回リスト**
- 過去にDLした話のncodeをもとに巡回リストの作成。
- ランキングなどからncodeを取り出して、巡回リストの作成。（底引網モード　^^;）
- ランキングの種類が細かく増えてきているので、どこまで対応するか・・・・
- 間隔、ジャンルの組み合わせが出来る様にする。（例。週間＋ファンタジー）
- 削除された小説が出てくるのでそのへんの対応
- ランキング情報を残しておいて、将来、順位の推移なども確認出来れば・・・

 - 1) l_get.bat f 　⇒すでに保存された全小説のncode一覧作成
 - 2) l_get.bat g 　⇒すでに保存されたお気に入りの小説のncode一覧作成
 - 3) l_get.bat d 　⇒日間ランキング300のncode一覧作成
 - 4) l_get.bat d5 　⇒日間ファンタジーランキング100のncode一覧作成
-**

**４）viewerとの連携**
- smoopyとの連携
 - 過去に読んだ続きから読めるようにする。smoopyから情報を保存して次回利用する。
 - smoopyにも履歴はあるが、その数には限界がある為の処置
 - 他のviewerは知らん　^^;
-**

**５）改稿への対応**
- これが、今まで対応出来ていなかった部分
- ダイジェスト化などで、話数が減少した時への対応。
 - HDDを圧迫するが、改稿等で更新された話も全話保存出来る様にする。
 - ファイル名にncode、話数、投稿日、改稿日を入れれば対応可能かと・・・
 - 旧ファイルは圧縮して保存しておく。いつでも、改稿前の状態に戻れる。

**6）他の小説投稿サイトへの対応**
