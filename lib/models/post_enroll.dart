import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future postEnroll(id) async {
  /**challenge 등록 */
  String url = "https://zikiza.duckdns.org/user/$id/enroll";
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String? token = await _secureStorage.read(key: 'id_token');

  var response = await http.post(
    Uri.parse(url),
    headers: {"Authorization": "Bearer " + token.toString()},
  );

  if (response.statusCode == 200) {
    print("챌린지 등록 성공 ${response.body}");
  } else {
    print(response.body);
  }
}
