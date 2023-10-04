import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/authentication.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: const Color.fromARGB(255, 43, 48, 78),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('lib/assets/human.png'),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      Provider.of<UserProvider>(context).user!.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Provider.of<UserProvider>(context).user!.email,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
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
                Navigator.pushNamed(context, "saved");
              },
            ),
            buildCardWithTitleAndListTile(
              title: 'Logout',
              icon: Icons.exit_to_app,
              onTap: () {
                _showLogoutConfirmation(context);
              },
            ),
          ],
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
      color: const Color.fromARGB(255, 43, 48, 78),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: onTap,
      ),
    );
  }

  Future<void> _showLogoutConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 16.0,
          backgroundColor: const Color.fromARGB(255, 231, 231, 231),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'lib/assets/spalsh.png',
                  width: 80.0,
                  height: 80.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Logout Confirmation',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 59, 50, 50),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 59, 50, 50),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: const Text(
                        'No',
                        style: TextStyle(
                          color: Color.fromARGB(255, 59, 50, 50),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 16.0),
                    ElevatedButton(
                      child: Text(
                        'Yes',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF4738CB),
                      ),
                      onPressed: () {
                        _signOut(context);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    // Add your Firebase sign-out logic here
    Authentication().signOut();
    Navigator.of(context).pop(); // Close the Profile screen
  }
}
