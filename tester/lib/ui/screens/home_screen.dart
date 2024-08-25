import 'package:flutter/material.dart';
import 'package:tester/ui/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;

  HomeScreen({this.imageHeight = 50, this.imageWidth = 150});

  @override
  Widget build(BuildContext context) {
    // Get the full width and height of the screen
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the width for the main content (90% of the screen width)
    final double mainWidth = screenWidth * 0.9;
    final double sideMargin = screenWidth * 0.05;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDDE6FF), Color(0xFFEFE7F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: sideMargin),
        child: Column(
          children: [
            // Search Field and Button at the Top
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () {
                      // Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      // Implement logic to navigate to the next featured page
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.search),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Main Body with Menu and Content Area
            Expanded(
              child: Row(
                children: [
                  // Menu Area
                  Expanded(
                    flex: 2, // 20% of the main width
                    child: Container(
                      color: Color(0xFF547EFF),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ListTile(
                            title: Text(
                              'Dashboard',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              'Products',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              'Make Order',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              'Transactions',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              'History',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {},
                            selected: true,
                            selectedTileColor: Color(0xFFFF7F37),
                          ),
                          // Add more menu items as needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Content Area
                  Expanded(
                    flex: 7, // 70% of the main width
                    child: Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          'Featured Page Content',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Company Logo at the Bottom
            Container(
              height: imageHeight,
              width: imageWidth,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/bcoder_logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
