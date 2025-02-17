import 'package:cuutaodi/pages/forgetpassword.dart';
import 'package:flutter/material.dart';

class PasswordEntryScreen extends StatefulWidget {
  @override
  _PasswordEntryScreenState createState() => _PasswordEntryScreenState();
}

class _PasswordEntryScreenState extends State<PasswordEntryScreen> {
  bool _obscureText = true; // To toggle password visibility

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle the boolean value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center most elements
              children: [
                                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                ),

                // Centered Logo with more space below
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20, // Reduced height for more space
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40), // Increased space between image and "Enter your password"
                
                // Enter your password Text (LEFT ALIGNED)
                Align(
                  alignment: Alignment.centerLeft, // Left alignment
                  child: Text(
                    'Nhập mật khẩu của bạn',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black for "Enter your password"
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Enter password for your account (LEFT ALIGNED)
                Align(
                  alignment: Alignment.centerLeft, // Left alignment
                  child: Text(
                    'Nhập mật khẩu cho tài khoản của bạn',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Black for this text
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Password Field (LEFT ALIGNED)
                TextFormField(
                  style: TextStyle(color: Colors.black), // Black text input
                  obscureText: _obscureText, // Use the obscureText property
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFC92127)), // Blood red border
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: _togglePasswordVisibility, // Toggle password visibility
                    ),
                  ),
                ),
                
                // Forgot Password (MORE TO THE LEFT)
                Align(
                  alignment: Alignment.centerLeft, // Left alignment
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.0), // Move slightly more to the left
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                        );
                      },
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          color: Color(0xFFC92127), // Blood red for "Forgot Password"
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Continue Button (CENTERED)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC92127), // Blood red color
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Tiếp tục',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // OR Divider (CENTERED)
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Hoặc',
                        style: TextStyle(color: Colors.black), // Black for "OR"
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Facebook and Google Buttons (CENTERED, BIGGER)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Facebook Button
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4, // Wider button
                      height: 50, // Taller button
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.facebook, color: Colors.white),
                        label: Text(
                          'Facebook',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF1877F2), // Facebook blue
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    
                    // Google Button
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4, // Wider button
                      height: 50, // Taller button
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.g_mobiledata, color: Colors.white),
                        label: Text(
                          'Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFFDB4437), // Google red
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Centered "By signing in" Text (CENTERED)
                Center(
                  child: Text(
                    'By signing in, you accept our Terms & Conditions',
                    style: TextStyle(color: Colors.black), // Black for this text
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Don't have an account? Register here (CENTERED)
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Không có tài khoản?",
                        style: TextStyle(color: Colors.black), // Black for this text
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: Color(0xFFC92127), // Blood red for "Register here"
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