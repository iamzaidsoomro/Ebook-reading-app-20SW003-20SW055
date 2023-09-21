import 'package:flutter/material.dart';
import 'package:flutter_application_1/search_bar.dart';
import 'package:flutter_application_1/trending_books.dart';
import 'favourites.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0, top: 8.0, left: 20.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/human.png'),
              radius: 20.0,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF4738CB),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/human.png'),
                    radius: 40.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Farheen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF0D0822),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.03),
          child: ListView(
            children: <Widget>[
              const Text(
                'Hi, Farheen',
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 230, 230),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'Keep exploring',
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 230, 230),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SearchBar(),
              SizedBox(
                height: screenSize.width * 0.03,
              ),
              const Text(
                'Trending Books',
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 230, 230),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              BookItem(),
              SizedBox(
                height: screenSize.width * 0.02,
              ),
              const Text(
                'My Favourites',
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 230, 230),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenSize.width * 0.015,
              ),
              Favourite(),
            ],
          ),
        ),
      ),
    );
  }
}
