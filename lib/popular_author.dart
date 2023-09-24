import 'package:flutter/material.dart';

import 'main.dart';

void main() {
  runApp(const MyApp());
}

class PopularAuthors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Authors',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularAuthors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage:
                            AssetImage(popularAuthors[index]['image']),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        popularAuthors[index]['name'],
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// List of popular authors with images and names
final List<Map<String, dynamic>> popularAuthors = [
  {
    'name': 'Author 1',
    'image': 'lib/assets/author1.png',
  },
  {
    'name': 'Author 2',
    'image': 'lib/assets/author2.png',
  },
  {
    'name': 'Author 3',
    'image': 'lib/assets/author3.png',
  },
  {
    'name': 'Author 4',
    'image': 'lib/assets/author4.png',
  },
  {
    'name': 'Author 5',
    'image': 'lib/assets/author5.png',
  },
  {
    'name': 'Author 6',
    'image': 'lib/assets/author6.png',
  },
  {
    'name': 'Author 7',
    'image': 'lib/assets/author7.png',
  },
  {
    'name': 'Author 8',
    'image': 'lib/assets/author8.png',
  },
];
