import 'package:flutter/material.dart';
import 'package:student/nextscreen.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  String _gender = '';
  List<String> _hobbies = [];
  bool _agreeTerms = false;
  String? _selectedYear;
  String? _selectedSemester;

  List<String> _years = ['FYBCA', 'SYBCA', 'TYBCA'];
  Map<String, List<String>> _semesterMap = {
    'FYBCA': ['FIRST_SEM', 'SECOND_SEM'],
    'SYBCA': ['THIRD_SEM', 'FOURTH_SEM'],
    'TYBCA': ['FIFTH_SEM', 'SIXTH_SEM']
  };

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: $_name');
      print('Email: $_email');
      print('Gender: $_gender');
      print('Hobbies: $_hobbies');
      print('Year of College: $_selectedYear');
      print('Semester: $_selectedSemester');
      print('Agree to terms: $_agreeTerms');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmation"),
            content: const Text("Are you sure you want to submit?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextScreen(
                        name: _name,
                        email: _email,
                        isFemale:
                            _gender == 'Female',
                        hobbies: _hobbies,
                        selectedYear: _selectedYear!,
                        semester: _selectedSemester,
                        selectedSemester: _selectedSemester!,
                        agreeTerms: _agreeTerms,
                        gender: _gender,
                      ),
                    ),
                  );
                },
                child: const Text("Yes"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          "Registration Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SizedBox(

            width: double.infinity,
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const ListTile(
                  title: Text('Gender'),
                ),
                RadioListTile(
                  title: const Text('Male'),
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Female'),
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                ),
                const ListTile(
                  title: Text('Hobbies'),
                ),
                CheckboxListTile(
                  title: const Text('Play'),
                  value: _hobbies.contains('Play'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        _hobbies.add('Play');
                      } else {
                        _hobbies.remove('Play');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Coding'),
                  value: _hobbies.contains('Coding'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        _hobbies.add('Coding');
                      } else {
                        _hobbies.remove('Coding');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Music'),
                  value: _hobbies.contains('Music'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        _hobbies.add('Music');
                      } else {
                        _hobbies.remove('Music');
                      }
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: 'Year of College',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  value: _selectedYear,
                  items: _years.map((year) {
                    return DropdownMenuItem<String>(
                      value: year,
                      child: Text(year,),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedYear = value;
                      _selectedSemester = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_selectedYear != null)
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        labelText: 'Semester',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                    value: _selectedSemester,
                    items: _semesterMap[_selectedYear!]?.map((semester) {
                      return DropdownMenuItem<String>(
                        value: semester,
                        child: Text(semester),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedSemester = value;
                      });
                    },
                  ),
                CheckboxListTile(
                  title: const Text('I agree to the terms and conditions'),
                  value: _agreeTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeTerms = value!;
                    });
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.grey,
                      minimumSize: const Size(170, 50)
                  ),
                  onPressed: _submitForm,
                  child: const Text('Submit',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
