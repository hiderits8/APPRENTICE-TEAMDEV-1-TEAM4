【リポジトリのクローン】
1.'xampp/htdocs'の中身を必要に応じてバックアップ
2.'xampp/htdocs'内にこのリポジトリをクローン


【ディレクトリ解説】
MVCに基づくディレクトリ構造を採用した。

xampp/htdocs
|-- /src #バックエンド
|   |-- /controllers #php JSから呼び出されるAPI群(modelsを呼び出す)
|   |-- /models #php DBへの操作用クラス群(DBに対するデータの取得、送信などが入る)
|   |-- /views #php UIファイル群(タイマーUI、偉人UIなどのphpファイル群)
|-- /public #フロントエンド
|   |-- /css 
|   |-- /js # このディレクトリにかなりの比重がある(API呼び出し、描画？、タイマー管理等
|   |-- /images # 画像ファイル
|   |-- index.php # メインページ用
|-- /config #設定ファイル
|   |-- database.php # DB接続用の設定(ホスト名やパスワードなど)
|-- /vendor #composerのファイル格納
|-- composer.json


【前提条件】
■ Xdebug
'which php'コマンド でphp実行ファイルの場所が出ないなら(windowsは'where php')
-> 環境変数にxamppのphp.exeを登録(Windowsの例:"C:\\xampp\\php\\php.exe")

場所が出るなら(xamppじゃない場所のphp使っている可能性もある)
-> 下記リンク先でバージョン情報を貼り付け、xdebugをインストール(環境により手順やディレクトリが異なる)
https://xdebug.org/wizard

主にやることは以下の3つ (phpのパスにより変動するので注意)
1.xampp/php/ext/ にxdebugのdllファイルを保存
2.xdebugのdllファイルを php_xdebug.dll に名前変更
3.xampp/php/php.ini に以下の記述を追加

---------------------------------------------------------------------------------------------------
[xdebug]
zend_extension = "C:\xampp\php\ext\php_xdebug.dll" ;追加したdllファイルのフルパス(確実なので)
xdebug.mode = debug ;debugモードON
xdebug.start_with_request = yes ;VSCodeから呼び出すため
---------------------------------------------------------------------------------------------------

'php -m'でモジュールの一覧に以下の記述があるか確認。
[Zend Modules]
Xdebug

vSCodeでhtdocs内の任意のphpファイルにブレークポイントを設定し、
'php 単体'を実行してブレークポイントが動作するか。

また、XAMPPからApacheを起動し、
'php 結合'を起動してから、
ブラウザの'localhost'、または'php ファイル名.php'でファイルを実行し
ブレークポイントが動作するかを確認。


■ nodejs(JSデバッグ用)
ターミナルで'node -v'コマンドを入力してバージョンが表示されるか。
-> 表示されない場合はNode.jsのインストール(v21.7.1)を行う。

Commitsの下に各OS用のインストーラーリンクがあるのでダウンロードする。
https://nodejs.org/en/blog/release/v21.7.1#2024-03-08-version-2171-current-targos

任意のJavaScriptファイルでブレークポイントを設定し、
デバッグ構成'JavaScript'を実行してブレークポイントが動作するか確認。


■ VS Code拡張機能
PHP
-> 静的解析、フォーマット(Alt + Shift + F)形式統一のため
