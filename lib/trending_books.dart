import 'package:flutter/material.dart';

import 'book.dart';

class BookItem extends StatelessWidget {
  BookItem({Key? key}) : super(key: key);

  final List<String> titles = [
    "Book1",
    "Book2",
    "Book3",
    "Book1",
    "Book2",
    "Book3"
  ];
  final List<String> authors = [
    "Author1",
    "Author2",
    "Author3",
    "Author1",
    "Author2",
    "Author3"
  ];
  final List<String> images = [
    "lib/assets/book3.jpg",
    "lib/assets/book4.jpg",
    "lib/assets/book5.jpg",
    "lib/assets/book6.jpg",
    "lib/assets/book1.jpg",
    "lib/assets/book2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: titles.asMap().entries.map((entry) {
            final index = entry.key;
            return GestureDetector(
              onTap: () {
                // Navigate to the Book class when a book is tapped
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Book(
                      bookTitle: titles[index],
                      bookAuthor: authors[index],
                      bookImage: images[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 2,
                      child: SizedBox(
                        width: 80,
                        height: 100,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entry.value,
                      style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      authors[index],
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
