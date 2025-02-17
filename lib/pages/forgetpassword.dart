import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
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

                // Logo at the top 1/3 of the screen
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Forget Password? Text (LEFT ALIGNED)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC92127), // Blood red color
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Provide your information to get your password (LEFT ALIGNED)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cung cấp thông tin của bạn để lấy lại mật khẩu',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Email/Phone Number Field (LEFT ALIGNED)
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Email hoặc SĐT',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFC92127)), // Blood red border
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Confirm Information Button (CENTERED)
                ElevatedButton(
                  onPressed: () {
                    // Add logic to confirm information
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC92127), // Blood red color
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Xác nhận thông tin',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Contact Hotline Text (LEFT ALIGNED)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hotline liên hệ: 076-263-1348',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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