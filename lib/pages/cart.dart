import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final List<Product> products = [
    Product(name: 'Product 1', price: 10.0, image: 'assets/logo.png'),
    Product(name: 'Product 2', price: 15.0, image: 'assets/logo.png'),
    Product(name: 'Product 3', price: 20.0, image: 'assets/logo.png'),
    Product(name: 'Product 4', price: 25.0, image: 'assets/logo.png'),
    Product(name: 'Product 5', price: 30.0, image: 'assets/logo.png'),
  ];

  double totalPrice = 0.0;
  bool selectAll = false;

  void calculateTotal() {
    totalPrice = products.where((product) => product.isSelected).fold(0.0, (sum, product) => sum + product.price);
    setState(() {});
  }

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      for (var product in products) {
        product.isSelected = selectAll;
      }
      calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mã khuyến mãi:'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View All'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Promo Code Details Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Use code: SAVE20 for 20% off!'),
                SizedBox(height: 10),
                Image.asset('assets/logo.png', height: 100), // Replace with your promo image
                SizedBox(height: 10),
                
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: toggleSelectAll,
                  child: Text('Select All (${products.length})'),
                ),
                Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(products[index].image, width: 50, height: 50),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].name),
                        Text(
                          '\$${products[index].price.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.grey), // Optional styling for price
                        ),
                      ],
                    ),
                    trailing: Checkbox(
                      value: products[index].isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          products[index].isSelected = value!;
                          calculateTotal();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle confirmation
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirmation'),
                    content: Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String image;
  bool isSelected;

  Product({required this.name, required this.price, required this.image, this.isSelected = false});
}