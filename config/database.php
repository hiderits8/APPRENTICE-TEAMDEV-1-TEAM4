<?php
// データベース接続情報
$host = 'localhost';
$dbname = 'database_name';
$user = 'username';
$password = 'password';

try {
    // PDOを使用してデータベースに接続
    $dbh = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    // エラーモードを例外に設定
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // エラーメッセージを表示
    echo 'Connection failed: ' . $e->getMessage();
}

