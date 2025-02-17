import 'package:cuutaodi/pages/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                       // Back Button (Top Left)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                ),
                // Logo (1/3 height of the screen)
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Full Name Field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Họ và tên',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFC92127)), // Blood red border
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),

                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  obscureText: true, // Hide password
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu (8-32 ký tự)',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFC92127)), // Blood red border
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    } else if (value.length < 8 || value.length > 32) {
                      return 'Mật khẩu phải từ 8 đến 32 ký tự';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40),

                // Create Account Button
                ElevatedButton(
                  onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()
                        ),
                        );
                    // Add account creation logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC92127), // Blood red color
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Tạo tài khoản',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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