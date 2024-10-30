import 'package:flutter/material.dart';
import 'package:perpustakaan/const.dart';
import 'package:perpustakaan/models/book_model.dart';
import 'package:perpustakaan/views/detail_view.dart';

class GenreBookPage extends StatelessWidget {
  final String genre;
  final List<BookModel> books;

  const GenreBookPage({super.key, required this.genre, required this.books});

  @override
  Widget build(BuildContext context) {
    // Filter buku berdasarkan genre yang dipilih
    final filteredBooks = books.where((book) => book.genre == genre).toList();

    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: Text(
          '$genre Books',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: appBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: filteredBooks.isEmpty
            ? Center(
                child: Text(
                  "No books found in $genre genre.",
                  style: const TextStyle(color: Colors.white70),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailPage(Book: book),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: book.poster,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              book.poster,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.width * 0.7,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
