import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  Favourite({Key? key});
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
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true, 
              physics:
                  const NeverScrollableScrollPhysics(), 
              itemCount: 6, 
              itemBuilder: (BuildContext context, int index) {
                return const Card(
                  color: Color.fromARGB(255, 43, 48, 78),
                  child: ListTile(
                    title: Text(
                      "BookName",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "AuthorName",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    leading: Image(image: AssetImage("lib/assets/book4.jpg")),
                    trailing: Icon(
                      Icons.favorite_rounded,
                      color: Color.fromARGB(255, 250, 46, 46),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
