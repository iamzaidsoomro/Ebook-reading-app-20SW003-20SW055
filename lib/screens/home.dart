import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/books_repo.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/screens/popular_author.dart';
import 'package:flutter_application_1/screens/search_bar.dart';
import 'package:flutter_application_1/screens/trending_books.dart';
import 'package:provider/provider.dart';
import '../network/authentication.dart';
import 'favourites.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    BooksRepo().getBooks();
    return Scaffold(
      backgroundColor: const Color(0xFF0D0822),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.03),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Text(
                'Hi, ${Provider.of<UserProvider>(context).user!.name}',
                style: const TextStyle(
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
              const AppSearchBar(),
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
              SizedBox(
                height: screenSize.width * 0.015,
              ),
              const PopularAuthors(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 22, 14, 53),
              Color(0xFF0D0822),
              Color.fromARGB(255, 28, 17, 46)
            ],
          ),
        ),
      ),

      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('lib/assets/human.png'),
                    ),
                    title: Text(
                      Provider.of<UserProvider>(context).user!.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      Provider.of<UserProvider>(context).user!.email.toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "homeview");
                    },
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'profile');
                    },
                    leading: const Icon(Icons.account_circle_rounded),
                    title: const Text('Profile'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'favourite');
                    },
                    leading: const Icon(Icons.favorite),
                    title: const Text('Favourites'),
                  ),
                  ListTile(
                    onTap: () {
                      _showLogoutConfirmation(context);
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: const Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D0822),
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, 'profile'); // Navigate to the profile screen
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/human.png'),
                  radius: 20.0,
                ),
              ),
            ),
          ],
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: const HomeView(),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Future<void> _showLogoutConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: const Color(0xFF0D0822),
          title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 16.0),
              const Text(
                'Are you sure you want to logout?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _signOut(context);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text('Yes'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    Authentication().signOut();
    Navigator.of(context).pop();
  }
}
