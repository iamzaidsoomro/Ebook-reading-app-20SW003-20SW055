import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/saved_book_model.dart';

class SavedBooksScreen extends StatefulWidget {
  const SavedBooksScreen({super.key});

  @override
  _SavedBooksScreenState createState() => _SavedBooksScreenState();
}

class _SavedBooksScreenState extends State<SavedBooksScreen> {
  // Define a list to store the saved books.
  List<SavedBook> savedBooks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Books'),
      ),
      body: ListView.builder(
        itemCount: savedBooks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(savedBooks[index].bookTitle),
            subtitle: Text(savedBooks[index].bookAuthor),
            leading: Image.asset(savedBooks[index].bookImage),
          );
        },
      ),
    );
  }
}
