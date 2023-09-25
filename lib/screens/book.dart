import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  final String bookTitle;
  final String bookAuthor;
  final String bookImage;

  Book({
    Key? key,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookImage,
  }) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  // Define variables to keep track of whether the book is liked and saved.
  bool isLiked = false;
  bool isSaved = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0822),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0822),
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
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 43, 48, 78),
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      height: 150,
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                image: AssetImage(widget.bookImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  widget.bookTitle,
                                  style: const TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  widget.bookAuthor,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const TabBar(
                  tabs: [
                    Tab(text: "Overview"),
                    Tab(text: "Author"),
                  ],
                  labelColor: Colors.white,
                  indicatorColor: Colors.yellow,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Overview Tab
                      SingleChildScrollView(
                        // Wrap the Overview Tab content in a SingleChildScrollView
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "About Book",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 65, 60, 60),
                                thickness: 1.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Toggle the liked status
                                      setState(() {
                                        isLiked = !isLiked;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          isLiked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: isLiked
                                              ? Colors.red
                                              : Colors.white,
                                        ),
                                        const SizedBox(width: 2.0),
                                        const Text(
                                          "Like",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Toggle the saved status
                                      setState(() {
                                        isSaved = !isSaved;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          isSaved
                                              ? Icons.bookmark
                                              : Icons.bookmark_border,
                                          color: isSaved
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                        const SizedBox(width: 2.0),
                                        const Text(
                                          "Save",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 65, 60, 60),
                                thickness: 1.0,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              //PopularAuthors(),
                              Center(
                                child: SizedBox(
                                  width:
                                      300.0, // Adjust the width as per your preference
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add the action you want to perform when the button is pressed.
                                      // For example, you can navigate to a different screen.
                                      // Navigator.pushNamed(context, '/read_book');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: const Color(0xFF4738CB),
                                      padding: const EdgeInsets.symmetric(
                                          vertical:
                                              16.0), // Increase vertical padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: const Text('Read Book'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Author Tab
                      // Author Tab
                      const SingleChildScrollView(
                        // Wrap the Author Tab content in a SingleChildScrollView
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Circular Avatar and Author Details
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: AssetImage(
                                        'lib/assets/human.png'), // Replace with the actual image path
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Author Name",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Author Designation",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // About Author Heading
                              SizedBox(height: 20.0),
                              Text(
                                "About Author",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.0),

                              // Author Description
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                              // Add more author information as needed
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
