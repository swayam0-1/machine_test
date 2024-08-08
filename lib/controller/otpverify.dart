import 'dart:convert';
import 'package:http/http.dart' as http;

class OTPServiceVerify {
  final String _baseUrl = 'http://devapiv4.dealsdray.com/api/v2/user/otp/verification';

  Future<Map<String, dynamic>> verifyOTP({
    required String otp,
    required String deviceId,
    required String userId,
    required String mobileNumber,
  }) async {
    try {
      // Define the request body
      final Map<String, String> requestBody = {
        'otp': otp,
        'deviceId': deviceId,
        'userId': userId,
        'mobileNumber':mobileNumber,
      };

      // Send the POST request
      final http.Response response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response body
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        // Handle error
        return {
          'success': false,
          'message': 'Failed to verify OTP. Status code: ${response.statusCode}',
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
