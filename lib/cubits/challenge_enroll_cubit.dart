import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
part 'challenge_enroll_state.dart';

class ChallengeEnrollCubit extends Cubit<ChallengeEnrollState> {
  ChallengeEnrollCubit() : super(ChallengeEnrollInitial());
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  Future<enrollPostData?> getEnroll(id) async {
    String url = "https://zikiza.duckdns.org/challenges/$id";

    final verifiedIdToken = _secureStorage.read(key: "id_token");

    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer " + verifiedIdToken.toString()},
    );

    enrollPostData? enrollData;
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      final response_data = utf8.decode(response.bodyBytes);
      enrollData = enrollPostData(
          id: jsonResponse['id'],
          topic: jsonResponse['topic'],
          howProof: jsonResponse['howProof'],
          expectedResults: jsonResponse['expectedResults'],
          pleaseNote: jsonResponse['pleaseNote']);

      log("getEnroll(): [200]Http get Challenge data successfully.\n${response_data}");
    } else {
      final response_data = response.body;
      log("getEnroll(): [403]Http get user data failed.\n${response_data}");
    }
    return enrollData;
  }
}

class enrollPostData {
  int? id;
  String? topic;
  String? howProof;
  String? expectedResults;
  String? pleaseNote;
  String? correctProof;
  String? periodStartDate;
  String? periodEndDate;
  String? expiredDay;

  enrollPostData({
    this.id,
    this.topic,
    this.howProof,
    this.expectedResults,
    this.pleaseNote,
    this.correctProof,
    this.periodStartDate,
    this.periodEndDate,
    this.expiredDay,
  });
}
