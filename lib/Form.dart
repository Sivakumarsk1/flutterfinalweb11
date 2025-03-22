import 'package:doc_appointment/secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(formscreen());
}

class formscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FamilyForm(),
    );
  }
}

class FamilyForm extends StatefulWidget {
  @override
  _FamilyFormState createState() => _FamilyFormState();
}

class _FamilyFormState extends State<FamilyForm> {
  // List to store family members' data
  List<Map<String, dynamic>> familyMembers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Member Form', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        shadowColor: Colors.blue.withOpacity(0.5),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the screen width is greater than 600 (considered as web/tablet)
          bool isWeb = constraints.maxWidth > 600;

          return Padding(
            padding: EdgeInsets.all(isWeb ? 32.0 : 16.0), // Adjust padding for web
            child: Column(
              children: [
                // Display existing family members
                Expanded(
                  child: ListView.builder(
                    itemCount: familyMembers.length,
                    itemBuilder: (context, index) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: FamilyMemberForm(
                          key: ValueKey(familyMembers[index]),
                          member: familyMembers[index],
                          onRemove: () {
                            setState(() {
                              familyMembers.removeAt(index);
                            });
                          },
                          isWeb: isWeb, // Pass the isWeb flag to the form
                        ),
                      );
                    },
                  ),
                ),
                // Add new family member buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAddButton('Add Spouse', Icons.person_add, Colors.blueAccent, isWeb),
                    _buildAddButton('Add Mom', Icons.person_add, Colors.green, isWeb),
                    _buildAddButton('Add Dad', Icons.person_add, Colors.orange, isWeb),
                  ],
                ),
                SizedBox(height: 20),
                // Next button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(familyMembers: familyMembers),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWeb ? 40 : 20, // Adjust padding for web
                      vertical: 10,
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: isWeb ? 20 : 18), // Adjust font size for web
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
              ],
            ),
          );
        },
      ),
    );
  }

  // Helper method to create add buttons
  Widget _buildAddButton(String label, IconData icon, Color color, bool isWeb) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          familyMembers.add({
            'name': '',
            'age': '',
            'gender': '',
            'type': label, // Add a type to identify the family member
          });
        });
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: isWeb ? 16 : 14), // Adjust font size for web
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        padding: EdgeInsets.symmetric(
          horizontal: isWeb ? 20 : 10, // Adjust padding for web
          vertical: isWeb ? 15 : 10,
        ),
      ),
    );
  }
}

class FamilyMemberForm extends StatelessWidget {
  final Map<String, dynamic> member;
  final VoidCallback onRemove;
  final bool isWeb;

  FamilyMemberForm({required this.member, required this.onRemove, required this.isWeb, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(isWeb ? 24.0 : 16.0), // Adjust padding for web
        child: Column(
          children: [
            Text(
              member['type'] ?? 'Family Member', // Display the type of family member
              style: TextStyle(fontSize: isWeb ? 22 : 18, fontWeight: FontWeight.bold), // Adjust font size for web
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                member['name'] = value;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                member['age'] = value;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                member['gender'] = value;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.red),
                onPressed: onRemove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}