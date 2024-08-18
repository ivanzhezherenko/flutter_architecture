import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<List<dynamic>> getObjects() async {
    final response = await http.get(Uri.parse('$baseUrl/objects'));

    if (response.statusCode != 200) throw Exception('Failed to load objects');

    return json.decode(response.body);
  }
}
