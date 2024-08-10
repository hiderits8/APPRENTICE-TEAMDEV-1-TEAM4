# ディレクトリ解説
MVCに基づくディレクトリ構造を採用した。


![image](https://github.com/user-attachments/assets/c4a2d3af-e80a-4394-be51-736db36ee346)



# 【Dockerを使用する場合の手順】
# リポジトリのクローン
任意のディレクトリにリポジトリをクローン





# 【XAMPPを使用する場合の手順】
# リポジトリのクローン
1.'xampp/htdocs'の中身を必要に応じてバックアップ  
2.'xampp/htdocs'内にこのリポジトリをクローン  

# 前提条件
## Xdebug
### 'which php'コマンド(mac)でphp実行ファイルの場所が表示されるか？
-> 環境変数にxamppのphp.exeを登録(Windowsの例:"C:\\xampp\\php\\php.exe")

### もし実行ファイルの場所が表示されるなら(xamppじゃない場所のphp使っている可能性もある)  
-> 下記リンク先でバージョン情報を貼り付け、xdebugをインストール(環境により手順やディレクトリが異なる)  
https://xdebug.org/wizard

### Xdebugのインストール手順3つ (phpのパスにより変動するので注意)  
1.xampp/php/ext/ にxdebugのdllファイルを保存  
2.xdebugのdllファイルを php_xdebug.dll に名前変更  
3.xampp/php/php.ini に以下の記述を追加  

[xdebug]
zend_extension = "C:\xampp\php\ext\php_xdebug.dll" ;追加したdllファイルのフルパス(確実なので)  
xdebug.mode = debug ;debugモードON  
xdebug.start_with_request = yes ;VSCodeから呼び出すため  

### xdebugインストールの確認
'php -m'でモジュールの一覧に以下の記述があるか確認。  
[Zend Modules]  
Xdebug  

### PHP単体用デバッグ構成の動作確認
vSCodeでhtdocs内の任意のphpファイルにブレークポイントを設定し、  
'php 単体'を実行してブレークポイントが動作するか。

### PHP結合用デバッグ構成の動作確認
また、XAMPPからApacheを起動し、
'php 結合'を起動してから、
ブラウザの'localhost'、または'php ファイル名.php'でファイルを実行し
ブレークポイントが動作するかを確認。


## nodejs(JSデバッグ用)
ターミナルで'node -v'コマンドを入力してバージョンが表示されるか。
-> 表示されない場合はNode.jsのインストール(v21.7.1)を行う。

Commitsの下に各OS用のインストーラーリンクがあるのでダウンロードする。
https://nodejs.org/en/blog/release/v21.7.1#2024-03-08-version-2171-current-targos

任意のJavaScriptファイルでブレークポイントを設定し、
デバッグ構成'JavaScript'を実行してブレークポイントが動作するか確認。


## VS Code拡張機能
PHP
-> 静的解析、フォーマット(Alt + Shift + F)形式統一のため

PHP Intelephense
W3C Web Validator
-> コーディング規約統一のため

JavaScript Debugger (Nightly)
-> JavaScriptデバッグのため


