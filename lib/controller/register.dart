import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterService {
  final String _baseUrl = "http://devapiv4.dealsdray.com/api/v2/user/email/referral";

  Future<Map<String, dynamic>> registerUser({
    required String email,
    required String password,
    required String referralCode,
    required String userId,
  }) async {
    final url = Uri.parse(_baseUrl);
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final body = json.encode({
      'email': email,
      'password': password,
      if(referralCode!=null)'referralCode': referralCode,
      'userId': userId,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        // Handle error response
        return {
          'success': false,
          'message': 'Failed to register: ${response.reasonPhrase}',
        };
      }
    } catch (e) {
      // Handle exception
      return {
        'success': false,
        'message': 'An error occurred: $e',
      };
    }
  }
}
