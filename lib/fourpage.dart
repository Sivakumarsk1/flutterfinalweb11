import 'package:flutter/material.dart';


class Fourpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FourthPage(),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review & Confirm', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        shadowColor: Colors.blue.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ADDRESS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '5 annai street, prame nager pammal chennai 17, atm, pammal, 600007',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'TESTS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Test Details
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTestDetail('Aravind, 24/M', 'Couple Health Check @ Home', '₹999', '₹199'),
                    Divider(),
                    _buildTestDetail('Sivakumar, 22/M', 'Couple Health Check @ Home', '₹999', '₹199'),
                    Divider(),
                    _buildTestDetail('Ram, 58/M', 'Couple Health Check @ Home', '₹999', '₹200'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total    ₹598',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Pick a Cashback Option',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Cashback Options
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('No Cashback'),
                      subtitle: Text(
                        'I Don\'t Want Cashback\n\n'
                        '- You will pay the standard amount\n'
                        '- No cashback will be added to your wallet\n'
                        '- You will miss out on amazing app only deals',
                      ),
                      trailing: Radio(
                        value: 'no_cashback',
                        groupValue: 'cashback',
                        onChanged: (value) {
                          // Handle cashback selection
                        },
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('DoctorC App Offer'),
                      subtitle: Text(
                        '₹50 Cashback\n\n'
                        '- Download DoctorC App after your booking for ₹50 cashback\n'
                        '- Cashback will be added to DoctorC wallet within 48 hours of your appointment being completed.\n'
                        '- Enjoy exclusive deals with DoctorC App',
                      ),
                      trailing: Radio(
                        value: 'doctorc_cashback',
                        groupValue: 'cashback',
                        onChanged: (value) {
                          // Handle cashback selection
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle confirm appointment logic
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Confirm Appointment',
                    style: TextStyle(fontSize: 18),
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
    );
  }

  // Helper method to build test details
  Widget _buildTestDetail(String name, String test, String originalPrice, String discountedPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(test, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(originalPrice, style: TextStyle(fontSize: 14, decoration: TextDecoration.lineThrough, color: Colors.grey)),
            Text(discountedPrice, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
          ],
        ),
      ],
    );
  }
}