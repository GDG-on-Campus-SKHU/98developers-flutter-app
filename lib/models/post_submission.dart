import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:developer';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// Future postSubmission(id, imageFile) async {
//   /**submission 제출 */
//   String apiUrl = "https://zikiza.duckdns.org/user/$id/takePhoto";
//   final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
//   String? token = await _secureStorage.read(key: 'id_token');
//   List<int> imageBytes = await File(imageFile).readAsBytes();
//   Uint8List uint8List = Uint8List.fromList(imageBytes);

//   // Compress image using the flutter_image_compress package
//   List<int> compressedBytes = await FlutterImageCompress.compressWithList(
//     uint8List,
//     minHeight: 100,
//     minWidth: 100,
//     quality: 20,
//     format: CompressFormat.jpeg,
//   );
//   var response = await http.post(Uri.parse(apiUrl),
//       headers: {"Authorization": "Bearer " + token.toString()},
//       body: {"image": File(imageFile)});

//   // var headers = {'Authorization': 'Bearer ' + token.toString()};
//   // var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
//   // // request.files.add(await http.MultipartFile.fromPath('image', '$imagePath'));
//   // request.files.add(http.MultipartFile.fromBytes(
//   //     'file', File(imageFile).readAsBytesSync(),
//   //     filename: imageFile));

//   // request.headers.addAll(headers);
//   // var response = await request.send();
//   // // http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     // var data = await response.stream.bytesToString();
//     log('성공');
//   } else {
//     print('실패');
//   }
// }
// Future<dynamic> postSubmission(id, dynamic input) async {
//   print("챌린지 사진을 서버에 업로드 합니다.");
//   var dio = new Dio();
//   try {
//     var formData =
//         FormData.fromMap({'file': await MultipartFile.fromFile(input)});

//     dio.options.contentType = 'multipart/form-data;boundary=--WebAppBoundary';
//     dio.options.maxRedirects.isFinite;
//     final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
//     String? token = await _secureStorage.read(key: 'id_token');

//     dio.options.headers = {'Authorization': 'Bearer ' + token.toString()};
//     var response = await dio.post(
//       'https://zikiza.duckdns.org/user/$id/takePhoto',
//       data: formData,
//     );
//     print('성공적으로 업로드했습니다');
//     return response.data;
//   } catch (e) {
//     print(e);
//   }
// }

Future<dynamic> postSubmission(id, dynamic input) async {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String? token = await _secureStorage.read(key: 'id_token');
  var headers = {'Authorization': 'Bearer ' + token.toString()};
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://zikiza.duckdns.org/user/$id/takePhoto'));

  request.files.add(await http.MultipartFile.fromPath('image', input,
      filename: '$input.jpg',
      contentType: MediaType.parse('multipart/form-data')));
  // request.files.add(await http.MultipartFile('imgae',input,filename: '$input',contentType: MediaType.parse('multipart/form-data')));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    print('suc');
  } else {
    print(response.reasonPhrase);
  }
}
