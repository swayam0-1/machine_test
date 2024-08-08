import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test/models/home_model.dart';

class HomeService {
  static const String _baseUrl = "http://devapiv4.dealsdray.com/api/v2/user/home/withoutPrice";

  Future<HomeModel?> fetchHomeData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // Parse the JSON data
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Map the JSON to the HomeModel
        return HomeModel.fromJson(jsonResponse);
      } else {
        // Handle the case where the server returned an error
        print("Failed to load data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle any other errors that might occur during the request
      print("Error occurred: $e");
      return null;
    }
  }
}
