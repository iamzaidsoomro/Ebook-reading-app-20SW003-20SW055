import 'package:flutter/material.dart';

class PopularAuthors extends StatelessWidget {
  const PopularAuthors({super.key});

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
    'image': 'lib/assets/human.png',
  },
  {
    'name': 'Author 2',
    'image': 'lib/assets/human.png',
  },
];
