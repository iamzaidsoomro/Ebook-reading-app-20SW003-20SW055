import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/books_repo.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5100,
      child: FutureBuilder(
          future: BooksRepo().getBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData == false) {
              return const Center(child: Text("No Data"));
            }
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                    color: const Color.fromARGB(255, 43, 48, 78),
                    child: Column(
                      children: [
                        Image.network(
                          snapshot.data![index].imgUrl,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.9,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data![index].title,
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
                          snapshot.data![index].type,
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
    );
  }
}
