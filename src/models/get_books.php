<?php
// データベース接続
function fetchBooksFromDatabase() {
    $pdo = new PDO('mysql:host=localhost;dbname=booksdb', 'user', 'password');
    $stmt = $pdo->query('SELECT * FROM books');
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>
