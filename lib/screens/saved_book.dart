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
      backgroundColor: const Color(0xFF0D0822),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Saved Books",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
