import 'package:doc_appointment/thirdpage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final List<Map<String, dynamic>> familyMembers;

  SecondPage({required this.familyMembers});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Track selected family members
  List<Map<String, dynamic>> selectedMembers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Family Member', style: TextStyle(color: Colors.white)),
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
              'Select a Person',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You need to select two family members',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            // Display family members with checkboxes
            Expanded(
              child: ListView.builder(
                itemCount: widget.familyMembers.length,
                itemBuilder: (context, index) {
                  final member = widget.familyMembers[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 10),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        member['name'],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${member['age']}/${member['gender']}'),
                      value: selectedMembers.contains(member),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            selectedMembers.add(member);
                          } else {
                            selectedMembers.remove(member);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Add Family Members',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _buildAddButton('Add Family Member'),
                _buildAddButton('Add Mom'),
                _buildAddButton('Add Dad'),
                _buildAddButton('Add Spouse'),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedMembers.length == 2) {
                    // Navigate to the next screen or perform an action
                    print('Selected Members: $selectedMembers');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select exactly two family members.'),
                      ),
                    );
                  }
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(),
                  ),
                );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Next',
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

  // Helper method to create add buttons
  Widget _buildAddButton(String text) {
    return ElevatedButton(
      onPressed: () {
        // Handle add button logic
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 3,
      ),
    );
  }
}