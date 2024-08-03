document.addEventListener('DOMContentLoaded', function() {
    fetch('../controllers/BookController.php') // コントローラーにリクエスト
        .then(response => response.json())
        .then(data => {
            const booksDataDiv = document.getElementById('books-data');
            if (data.error) {
                booksDataDiv.innerHTML = '<p>Error: ' + data.error + '</p>';
            } else {
                data.forEach(book => {
                    booksDataDiv.innerHTML += `
                        <p>ID: ${book.book_id}, Thickness: ${book.book_thickness}, Color: ${book.book_color}</p>
                        <img src="..public/images/book_purple_1.png" alt="Book Image">
                    `;
                });
            }
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
});
