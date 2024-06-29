import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://latihan.majuraya.com';

  Future<String> postData(Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('$baseUrl/insert_data.php');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle 200 (OK) and 201 (Created)
        print('Response Body: ${response.body}');
        return response.body;
      } else {
        print('Error: ${response.body}');
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Error during request: $error');
    }
  }
}
