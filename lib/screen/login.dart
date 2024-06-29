import 'package:daycare/screen/listanak.dart';
import 'package:flutter/material.dart';
import 'package:daycare/screen/home_orangtua.dart';
import 'package:daycare/screen/dailyreport.dart';
import 'register.dart';
import 'package:daycare/models/datapengasuh.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
          MaterialPageRoute(builder: (context) => const ListAnakScreen()),
        );
      } else if (user['kode'] == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OrangtuaScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cita Harmoni'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        centerTitle: true,
        backgroundColor: const Color(0XFF909FF9),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: Image.asset('images/shapes.png')),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Welcome Back!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => login(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFFC7275)),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum memiliki akun? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: const Text(
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
