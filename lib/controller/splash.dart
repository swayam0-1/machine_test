import 'dart:convert';
import 'package:http/http.dart' as http;
class SplashApi{
  final String baseUrl='http://devapiv4.dealsdray.com/api/v2/user/device/add';
  Future<Map<String,dynamic>?> addDevice(Map<String,dynamic> requestBody) async{
    try{
      final response=await http.post(Uri.parse(baseUrl),
      headers: {
        'Content-Type':'application/json',
        },
        body: jsonEncode(requestBody),
      );
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }else{
        throw Exception("Failed to add device:${response.statusCode}");
        return null;
      }
    }catch(e){
      print("Error:$e");
      return null;
    }
  }
}