import 'package:flutter/material.dart';
import 'package:daycare/models/dataanak.dart';
import 'package:daycare/screen/dailyreport.dart';

class DetailAnakScreen extends StatelessWidget {
  final DataAnak dataAnak;

  const DetailAnakScreen({required this.dataAnak, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Anak',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0XFF909FF9),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/face.png'),
              ),
            ),
            const SizedBox(height: 20),
            _buildDetailItem('Nama', dataAnak.namaAnak),
            _buildDetailItem('Jenis Kelamin', dataAnak.gender),
            _buildDetailItem('Nama Orang Tua', dataAnak.parentName),
            _buildDetailItem('Kontak Orang Tua', dataAnak.parentContact),
            const SizedBox(height: 20),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          print("Button Pressed!");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DailyReportScreen(dataAnak: dataAnak),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFFFC7275),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        child: const Text(
          'Buat Daily Report',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
