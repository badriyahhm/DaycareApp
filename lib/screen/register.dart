import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController parentNamesController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dobController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/create.png',
              fit: BoxFit.fitWidth,
            ),
            Container(
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: TextField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Kids Full Name'),
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: dobController,
                    decoration: InputDecoration(labelText: 'Date of Birth'),
                  ),
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                value: 'Male',
                items: <String>['Male', 'Female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: TextField(
                controller: parentNamesController,
                decoration: InputDecoration(labelText: 'Parent/Guardian Names'),
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: TextField(
                controller: contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Numbers'),
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFFFC7275)),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              margin: EdgeInsets.fromLTRB(30, 15, 30, 30),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
