import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpService {
  final String _baseUrl = "http://devapiv4.dealsdray.com/api/v2/user/otp";

  Future<bool> sendOtp(String mobileNumber, String deviceId) async {
    final url = Uri.parse(_baseUrl);
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "mobileNumber": mobileNumber,
      "deviceId": deviceId,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Assuming a successful OTP request returns a 200 status code
        return true;
      } else {
        print('Failed to send OTP: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return false;
    }
  }
}
