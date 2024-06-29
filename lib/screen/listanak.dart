import 'package:flutter/material.dart';
import 'package:daycare/models/dataanak.dart';
import 'package:daycare/screen/detail_anak.dart';
import 'package:daycare/screen/login.dart';

class ListAnakScreen extends StatelessWidget {
  const ListAnakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cita Harmoni',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0XFF909FF9),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'images/mascots.png',
            fit: BoxFit.fitWidth,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: childrenData.length,
              itemBuilder: (context, index) {
                final child = childrenData[index];
                Color backgroundColor = child.gender == 'Female'
                    ? const Color(0XFFFFE2DF)
                    : const Color(0XFFE2E6FF);
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(child.namaAnak,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Parent: ${child.parentName}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailAnakScreen(dataAnak: child),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
