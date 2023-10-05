import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/books_repo.dart';

class Favourite extends StatelessWidget {
  Favourite({Key? key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: BooksRepo().getBooks(),
                builder: (context, snapshot) {
                  var books = jsonDecode(snapshot.data.toString());
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: const Color.fromARGB(255, 43, 48, 78),
                          child: Column(
                            children: [
                              Image.network(
                                books['data'][index]['thumb'],
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * 0.9,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                books['data'][index]['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                books['data'][index]['sub_title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ],
                          ));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
