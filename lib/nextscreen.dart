import 'package:flutter/material.dart';
import 'package:student/Custom_Card_Widget.dart';

class NextScreen extends StatelessWidget {
  final String name;
  final String email;
  final bool isFemale;
  final List<String> hobbies;
  final String selectedYear;
  final String selectedSemester;
  final bool agreeTerms;
  String _gender;

  NextScreen({
    required this.name,
    required this.email,
    required this.isFemale,
    required this.hobbies,
    required this.selectedYear,
    required this.selectedSemester,
    required this.agreeTerms,
    required String gender, String? semester,
  }) : _gender = gender; 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildCard('Sport', name, 0),
            buildCard('Email', email, 1), 
            buildCard('Gender', isFemale ? 'Female' : 'Male', 2), 
            buildCard('Hobbies', hobbies.join(", "), 3), 
            buildCard('Year of College', selectedYear, 4), 
            buildCard('Semester', selectedSemester, 5), 
            buildCard('Agree to terms', agreeTerms ? 'Yes' : 'No', 6), 
          ],
        ),
      ),
    );
  }

}
