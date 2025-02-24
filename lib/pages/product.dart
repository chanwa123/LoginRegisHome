import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Page',
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1; // Initial quantity

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Action for search button
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Action for home button
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Action for shopping cart button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ảnh sp
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(''), 
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 16),

            // Product Name
            Text(
              'Tên',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // Product Price
            Text(
              '\$29.99',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),

            // Color Selection
            Text('Chọn màu:', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                _colorButton(Colors.red),
                SizedBox(width: 8),
                _colorButton(Colors.blue),
                SizedBox(width: 8),
                _colorButton(Colors.green),
              ],
            ),
            SizedBox(height: 16),

            // Delivery Address
            Text('Giao hàng tới:', style: TextStyle(fontSize: 18)),
            Text('123', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),

            // Quantity Adjustment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: _decreaseQuantity,
                    ),
                    Text('$_quantity', style: TextStyle(fontSize: 20)),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _increaseQuantity,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add to cart action
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Buy Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Buy now action
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create color selection buttons
  Widget _colorButton(Color color) {
    return GestureDetector(
      onTap: () {
        // Handle color selection
        // You can add logic to update the selected color
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1), // Optional border
        ),
      ),
    );
  }
}
