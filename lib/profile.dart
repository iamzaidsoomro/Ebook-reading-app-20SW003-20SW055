import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF0D0822),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                margin: const EdgeInsets.all(16.0),
                elevation: 4.0,
                color: Color.fromARGB(255, 43, 48, 78), // Set background color
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('lib/assets/human.png'),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color
                        ),
                      ),
                      Text(
                        'johndoe@email.com',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white, // Set text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildCardWithTitleAndListTile(
                title: 'Your Favorites',
                icon: Icons.favorite,
                onTap: () {
                  Navigator.pushNamed(context, "favourite");
                },
              ),
              buildCardWithTitleAndListTile(
                title: 'Saved Books',
                icon: Icons.bookmark,
                onTap: () {
                  // Handle Saved Books tap
                },
              ),
              buildCardWithTitleAndListTile(
                title: 'Logout',
                icon: Icons.exit_to_app,
                onTap: () {
                  // Handle Logout tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardWithTitleAndListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      color: const Color.fromARGB(255, 43, 48, 78), // Set background color
      child: ListTile(
        leading: Icon(icon, color: Colors.white), // Set icon color
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white, // Set text color
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios,
            color: Colors.white), // Set icon color
        onTap: onTap,
      ),
    );
  }
}
