import 'package:flutter/material.dart';
import 'package:daycare/models/dataanak.dart';
import 'package:daycare/screen/dailyreport.dart';
import 'package:daycare/models/database_helper.dart';

class DetailAnakScreen extends StatefulWidget {
  final DataAnak dataAnak;

  const DetailAnakScreen({required this.dataAnak, super.key});

  @override
  _DetailAnakScreenState createState() => _DetailAnakScreenState();
}

class _DetailAnakScreenState extends State<DetailAnakScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> _dailyReports = [];

  @override
  void initState() {
    super.initState();
    _refreshDailyReports();
  }

  Future<void> _refreshDailyReports() async {
    final data = await _dbHelper.getDailyReports(widget.dataAnak.id);
    setState(() {
      _dailyReports = data;
    });
  }

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                  _buildDetailItem('Nama', widget.dataAnak.namaAnak),
                  _buildDetailItem('Jenis Kelamin', widget.dataAnak.gender),
                  _buildDetailItem(
                      'Nama Orang Tua', widget.dataAnak.parentName),
                  _buildDetailItem(
                      'Kontak Orang Tua', widget.dataAnak.parentContact),
                  const SizedBox(height: 20),
                  const Divider(), // Garis pemisah
                  const SizedBox(height: 10),
                  _buildDailyReportList(),
                ],
              ),
            ),
          ),
          _buildButton(context), // Button tetap berada di bawah halaman
        ],
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

  Widget _buildDailyReportList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Reports:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _dailyReports.isEmpty
            ? const Text(
                'Belum ada daily report.',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _dailyReports.length,
                itemBuilder: (context, index) {
                  final report = _dailyReports[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Tanggal: ${report['date']}'),
                      subtitle: Text('Aktivitas: ${report['conditions']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DailyReportScreen(
                                    dataAnak: widget.dataAnak,
                                    reportId: report['id'],
                                  ),
                                ),
                              ).then((_) => _refreshDailyReports());
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteDailyReport(report['id']);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }

  void _deleteDailyReport(int id) async {
    await _dbHelper.deleteDailyReport(id);
    _refreshDailyReports();
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DailyReportScreen(dataAnak: widget.dataAnak),
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
