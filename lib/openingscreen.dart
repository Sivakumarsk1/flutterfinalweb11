import 'package:flutter/material.dart';
import 'package:doc_appointment/Form.dart'; // Import your form screen

class Openingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OpeningScreen(),
    );
  }
}

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Check if the screen is web (width > 600)
    bool isWeb = screenWidth > 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isWeb ? 32.0 : 16.0), // Adjust padding for web
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isWeb ? 60 : 40), // Adjust spacing for web
              // Logo or Title
              Center(
                child: Text(
                  'Pentagon Clinic',
                  style: TextStyle(
                    fontSize: isWeb ? 48 : 32, // Adjust font size for web
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: isWeb ? 40 : 20), // Adjust spacing for web
              // Package Title
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Couple',
                        style: TextStyle(
                          fontSize: isWeb ? 36 : 24, // Adjust font size for web
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      TextSpan(
                        text: ' Health Check @ Home',
                        style: TextStyle(
                          fontSize: isWeb ? 36 : 24, // Adjust font size for web
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: isWeb ? 30 : 20), // Adjust spacing for web
              // Price Section
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '\$1988',
                            style: TextStyle(
                              fontSize: isWeb ? 42 : 30, // Adjust font size for web
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: isWeb ? 40 : 20), // Adjust spacing for web
                    Text(
                      '₹399',
                      style: TextStyle(
                        fontSize: isWeb ? 42 : 30, // Adjust font size for web
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isWeb ? 40 : 20), // Adjust spacing for web
              // Features List
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '- Reports on WhatsApp',
                      style: TextStyle(fontSize: isWeb ? 24 : 16), // Adjust font size for web
                    ),
                    Text(
                      '- 33 Tests View Tests',
                      style: TextStyle(fontSize: isWeb ? 24 : 16), // Adjust font size for web
                    ),
                  ],
                ),
              ),
              SizedBox(height: isWeb ? 40 : 20), // Adjust spacing for web
              // Package Info
              Center(
                child: Text(
                  'Package includes tests for **2** people',
                  style: TextStyle(
                    fontSize: isWeb ? 24 : 16, // Adjust font size for web
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: isWeb ? 60 : 40), // Adjust spacing for web
              // Mobile Number Input
              Center(
                child: Text(
                  'Enter your mobile number to unlock this deal',
                  style: TextStyle(
                    fontSize: isWeb ? 24 : 16, // Adjust font size for web
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: isWeb ? 20 : 10), // Adjust spacing for web
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isWeb ? 20 : 10, // Adjust padding for web
                        vertical: isWeb ? 15 : 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '+91',
                        style: TextStyle(fontSize: isWeb ? 24 : 16), // Adjust font size for web
                      ),
                    ),
                    SizedBox(width: isWeb ? 20 : 10), // Adjust spacing for web
                    Container(
                      width: isWeb ? screenWidth * 0.3 : screenWidth * 0.6, // Adjust width for web
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your mobile number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isWeb ? 60 : 40), // Adjust spacing for web
              // Unlock Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the form screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => formscreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWeb ? 60 : 40, // Adjust padding for web
                      vertical: isWeb ? 20 : 15,
                    ),
                    child: Text(
                      'Unlock',
                      style: TextStyle(fontSize: isWeb ? 28 : 18), // Adjust font size for web
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}