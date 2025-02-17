import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> buttonLabels = [
    'Flash sale',
    'Truyen tranh',
    'Bang xep hang ',
    'Tiep thuc Sai Gon',
    'Ma Khuyen Mai',
    'San pham moi',
    'Goi y',
    'Phien cho sach cu',
    'Back to school',
    'Review sach',
  ];

  final List<String> productImages = [
    'assets/logo.png',
    'assets/logo.png',
    'assets/logo.png',
    'assets/logo.png',
    'assets/logo.png',
    'assets/logo.png',
    'assets/logo.png',
    'assets/logo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.qr_code), onPressed: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Static Image (Replaces Carousel)
            Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20), // Increased top margin
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Circular category buttons in a single column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0, // Horizontal spacing between buttons
                runSpacing: 8.0, // Vertical spacing between buttons
                alignment: WrapAlignment.center,
                children: buttonLabels.map((label) {
                  return SizedBox(
                    width: 60, // Smaller width for circular buttons
                    height: 60, // Smaller height for circular buttons
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 10)),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), // Circular button
                        padding: EdgeInsets.all(8), // Padding inside the button
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Horizontal scrollable products
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'Recommend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}