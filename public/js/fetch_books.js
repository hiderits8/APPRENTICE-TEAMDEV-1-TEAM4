document.addEventListener('DOMContentLoaded', function() {
    fetch('../src/controllers/fetch_books.php')
        .then(response => response.json())
        .then(data => {
            const booksDataDiv = document.getElementById('books-data');
            if (data.error) {
                booksDataDiv.innerHTML = '<p>Error: ' + data.error + '</p>';
            } else {
                data.forEach(book => {
                    booksDataDiv.innerHTML += `<p>ID: ${book.book_id}, Thickness: ${book.book_thickness}, Color: ${book.book_color}</p>`;
                });
            }
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
});
