import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<getChallengesModel> getChallenges(id) async {
  /**userData 조회 */
  String url = "https://zikiza.duckdns.org/challenges/$id";
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String? token = await _secureStorage.read(key: 'id_token');
  getChallengesModel getModel;

  var response = await http.get(
    Uri.parse(url),
    headers: {"Authorization": "Bearer " + token.toString()},
  );
  var data = json.decode(utf8.decode(response.bodyBytes));

  log('첼린지 조회 성공 ${utf8.decode(response.bodyBytes)}');
  getModel = getChallengesModel(
      topic: data['topic'], expectedResults: data['expectedResults']);
  return getModel;
}

class getChallengesModel {
  int? id;
  String? topic;
  String? howProof;
  String? expectedResults;
  String? pleaseNote;
  String? correctProof;
  String? periodStartDate;
  String? periodEndDate;
  String? expiredDay;
  List<Members>? members;

  getChallengesModel(
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

  getChallengesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topic = json['topic'];
    howProof = json['howProof'];
    expectedResults = json['expectedResults'];
    pleaseNote = json['pleaseNote'];
    correctProof = json['correctProof'];
    periodStartDate = json['periodStartDate'];
    periodEndDate = json['periodEndDate'];
    expiredDay = json['expiredDay'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
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
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  Member? member;
  String? image;
  bool? isSuccess;

  Members({this.member, this.image, this.isSuccess});

  Members.fromJson(Map<String, dynamic> json) {
    member =
        json['member'] != null ? new Member.fromJson(json['member']) : null;
    image = json['image'];
    isSuccess = json['isSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.member != null) {
      data['member'] = this.member!.toJson();
    }
    data['image'] = this.image;
    data['isSuccess'] = this.isSuccess;
    return data;
  }
}

class Member {
  String? uid;
  String? email;
  String? name;
  String? avatar;
  Null? challenges;

  Member({this.uid, this.email, this.name, this.avatar, this.challenges});

  Member.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    challenges = json['challenges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['challenges'] = this.challenges;
    return data;
  }
}
