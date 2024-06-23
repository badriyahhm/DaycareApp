import 'package:daycare/screen/listanak.dart';
import 'package:flutter/material.dart';
import 'package:daycare/screen/home_orangtua.dart';
import 'package:daycare/screen/dailyreport.dart';
import 'register.dart';
import 'package:daycare/models/datapengasuh.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    Map<String, dynamic>? user = PengasuhData.users.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => {'kode': 0},
    );

    if (user != null) {
      if (user['kode'] == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ListAnakScreen()),
        );
      } else if (user['kode'] == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OrangtuaScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cita Harmoni'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        centerTitle: true,
        backgroundColor: const Color(0XFF909FF9),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: Image.asset('images/shapes.png'),
              margin: EdgeInsets.only(top: 40),
            ),
            Container(
              child: Text(
                'Welcome Back!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            Container(
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => login(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFFFC7275)),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum memiliki akun? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Color(0XFF2C55A4)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
