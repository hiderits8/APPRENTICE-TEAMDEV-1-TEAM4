<?php
// モデルをインクルード
include '../models/get_books.php';

// データを取得する
function getBooks() {
    // モデルからデータを取得
    $books = fetchBooksFromDatabase();

    // 結果をJSON形式で返す
    header('Content-Type: application/json');
    echo json_encode($books);
}

// リクエストに応じて処理を実行
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    getBooks();
}
