import 'package:flutter/material.dart';
import 'package:tester/ui/screens/dashboard_screen.dart';
import 'package:tester/ui/screens/login_screen.dart';
import 'package:tester/ui/screens/products_screen.dart';
import 'package:tester/ui/screens/makeorder_screen.dart';
import 'package:tester/ui/screens/transactions_screen.dart';
import 'package:tester/ui/screens/history_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Default selected page
  Widget _selectedPage = DashboardScreen();
  int _selectedIndex = 0; // Track the index of the selected menu item

  // Hover state tracking
  int _hoveredIndex = -1;

  // Function to update the selected page
  void _selectPage(int index, Widget page) {
    setState(() {
      _selectedIndex = index;
      _selectedPage = page;
    });
  }

  final double imageHeight = 60;
  final double imageWidth = 150;

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
                          _buildMenuItem(
                            index: 0,
                            title: 'Dashboard',
                            screen: DashboardScreen(),
                          ),
                          _buildMenuItem(
                            index: 1,
                            title: 'Products',
                            screen: ProductsScreen(),
                          ),
                          _buildMenuItem(
                            index: 2,
                            title: 'Make Order',
                            screen: MakeOrderScreen(),
                          ),
                          _buildMenuItem(
                            index: 3,
                            title: 'Transactions',
                            screen: TransactionsScreen(),
                          ),
                          _buildMenuItem(
                            index: 4,
                            title: 'History',
                            screen: HistoryScreen(),
                          ),
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
                      child: _selectedPage,
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

  Widget _buildMenuItem({required int index, required String title, required Widget screen}) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        tileColor: _selectedIndex == index
            ? Color(0xFFFF7F37) // Background color when selected
            : _hoveredIndex == index
            ? Color(0x98B1FFFF) // Background color on hover
            : null, // Default color
        onTap: () {
          _selectPage(index, screen);
        },
      ),
    );
  }
}
