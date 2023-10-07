import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/books_repo.dart';

import 'book.dart';

class BookItem extends StatelessWidget {
  BookItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: FutureBuilder(
            future: BooksRepo().getBooks(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    var books = snapshot.data;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Book(
                                      bookTitle: books[index].title,
                                      bookAuthor: books[index].author,
                                      bookImage: books[index].imgUrl,
                                      summary: books[index].summary,
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                    books![index].imgUrl.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  books[index].title.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  books[index].type,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }));
  }
}
