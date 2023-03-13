import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'challenge_list_state.dart';

class ChallengeListCubit extends Cubit<ChallengeListState> {
  ChallengeListCubit() : super(ChallengeListInitial());
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  Future<getChallengeList?> getChalllengeList() async {
    const String url = "https://zikiza.duckdns.org/challenges";

    final verifiedIdToken = _secureStorage.read(key: "id_token");

    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer " + verifiedIdToken.toString()},
    );

    getChallengeList? challengeList;
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      final response_data = utf8.decode(response.bodyBytes);
      challengeList = getChallengeList.fromJson(jsonResponse);

      log("getChalllengeList(): [200]Http get Challenge data successfully.\n${response_data}");
    } else if (response.statusCode == 401) {
      final response_data = response.body;
      log("getChalllengeList(): [401]Not valid access token.\n${response_data}");
    } else if (response.statusCode == 403) {
      final response_data = response.body;
      log("getChalllengeList(): [403]Http get user data failed.\n${response_data}");
    }

    return challengeList;
  }
}

class getChallengeList {
  List<challngeListData> listData;

  getChallengeList({
    required this.listData,
  });

  factory getChallengeList.fromJson(List<dynamic> json) {
    List<challngeListData> challengeList = <challngeListData>[];
    challengeList = json.map((i) => challngeListData.fromJson(i)).toList();

    return new getChallengeList(listData: challengeList);
  }
}

class challngeListData {
  int? id;
  String? topic;
  String? howProof;
  String? expectedResults;
  String? pleaseNote;
  String? correctProof;
  String? periodStartDate;
  String? periodEndDate;
  String? expiredDay;
  int? members;

  challngeListData(
      {this.id,
      this.topic,
      this.howProof,
      this.expectedResults,
      this.pleaseNote,
      this.correctProof,
      this.periodStartDate,
      this.periodEndDate,
      this.expiredDay,
      this.members});

  challngeListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topic = json['topic'];
    howProof = json['howProof'];
    expectedResults = json['expectedResults'];
    pleaseNote = json['pleaseNote'];
    correctProof = json['correctProof'];
    periodStartDate = json['periodStartDate'];
    periodEndDate = json['periodEndDate'];
    expiredDay = json['expiredDay'];
    members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['topic'] = this.topic;
    data['howProof'] = this.howProof;
    data['expectedResults'] = this.expectedResults;
    data['pleaseNote'] = this.pleaseNote;
    data['correctProof'] = this.correctProof;
    data['periodStartDate'] = this.periodStartDate;
    data['periodEndDate'] = this.periodEndDate;
    data['expiredDay'] = this.expiredDay;
    data['members'] = this.members;
    return data;
  }
}
