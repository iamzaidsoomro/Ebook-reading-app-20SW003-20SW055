import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/book_model.dart';

class BooksRepo {
  Future<List<BookModel>> getBooks() async {
    List<BookModel> books = [];
    await FirebaseFirestore.instance
        .collection("books")
        .doc('discoverSection')
        .get()
        .then((value) {
      for (var i = 0; i < value.data()!['bookList'].length; i++) {
        books.add(BookModel(
          id: value.data()!['bookList'][i]['id'],
          author: value.data()!['bookList'][i]['author'],
          title: value.data()!['bookList'][i]['title'],
          imgUrl: value.data()!['bookList'][i]['imgUrl'],
          summary: value.data()!['bookList'][i]['summary'],
          type: value.data()!['bookList'][i]['type'],
        ));
      }
    });
    return books;
  }

  addToFavorites(bookId, email) async {
    await FirebaseFirestore.instance.collection("users").doc(email).update({
      "favorites": FieldValue.arrayUnion([bookId])
    });
  }

  Future<bool> isFavorite(bookName) async {
    return await FirebaseFirestore.instance
        .collection("books")
        .doc("discoverSection")
        .get()
        .then((value) => value.data()!['bookList'].contains(bookName));
  }

  Future<List> fetchFavorites(email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .get()
        .then((value) {
      return value.data()!['favorites'];
    });
  }
}
