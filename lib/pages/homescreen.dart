import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        leading: IconButton(
          icon: Icon(Icons.menu), // Menu icon
          onPressed: () {
            // Action for the menu button
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Menu button pressed')),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),

            // Small Image
            Container(
              height: 100,
              width: 350,
              color: Colors.blue, // Placeholder for the image
              child: Center(child: Text('Img')),
            ),
            SizedBox(height: 20),

            // Icons with Names (8 Icons in 2 Rows)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconColumn(Icons.home, 'Home'),
                    _buildIconColumn(Icons.category, 'Category'),
                    _buildIconColumn(Icons.favorite, 'Favorites'),
                    _buildIconColumn(Icons.shopping_cart, 'Cart'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconColumn(Icons.person, 'Profile'),
                    _buildIconColumn(Icons.settings, 'Settings'),
                    _buildIconColumn(Icons.notifications, 'Notifications'),
                    _buildIconColumn(Icons.help, 'Help'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Product Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image and Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green, // Placeholder for the product image
                      child: Center(child: Text('Product')),
                    ),
                    SizedBox(height: 10), // Space between image and details
                    // Product Details
                    Text('Product Name', style: TextStyle(fontSize: 18)),
                    Text('\$29.99', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    // Cart Image
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        // Add to cart action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Set the current index to the first item
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        onTap: (index) {
          // Handle item tap
          // You can navigate to different screens or perform actions based on the index
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: ${index + 1}')),
          );
        },
      ),
    );
  }

  // Helper method to build icon columns
  Column _buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon),
        Text(label),
      ],
    );
  }
}