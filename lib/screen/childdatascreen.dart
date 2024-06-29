import 'package:flutter/material.dart';
import 'package:daycare/models/api_service.dart';

class ChildDataScreen extends StatefulWidget {
  final String userId;

  const ChildDataScreen({required this.userId, super.key});

  @override
  _ChildDataScreenState createState() => _ChildDataScreenState();
}

class _ChildDataScreenState extends State<ChildDataScreen> {
  final TextEditingController childNameController = TextEditingController();
  final TextEditingController childAgeController = TextEditingController();

  @override
  void dispose() {
    childNameController.dispose();
    childAgeController.dispose();
    super.dispose();
  }

  Future<void> _submitChildData() async {
    final data = {
      'parent_id': widget.userId,
      'child_name': childNameController.text,
      'child_age': childAgeController.text,
    };

    try {
      final responseMessage = await ApiService().postData(data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseMessage)),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: childNameController,
              decoration: InputDecoration(labelText: 'Child Name'),
            ),
            TextField(
              controller: childAgeController,
              decoration: InputDecoration(labelText: 'Child Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitChildData,
              child: Text('Submit Child Data'),
            ),
          ],
        ),
      ),
    );
  }
}
