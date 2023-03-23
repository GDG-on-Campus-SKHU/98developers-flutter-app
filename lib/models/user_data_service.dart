import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zikiza/utilities/constants.dart';

Future<CurrentUser> getUserData() async {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String? token = await _secureStorage.read(key: 'id_token');
  CurrentUser? currentUser;

  var response = await http.get(
    Uri.parse("https://zikiza.duckdns.org/users"),
    headers: {
      "Authorization": "Bearer " + token.toString(),
    },
  );

  final responseData = json.decode(utf8.decode(response.bodyBytes));
  var data = responseData;

  log("getUserData(): [200]Http get Challenge data successfully.\n${responseData}");
  log("getUserData(): [200]Http get Challenge data successfully.\n${data}");

  currentUser = CurrentUser(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
      challenges: [Challenges.fromJson(data['challenges']?[0])]
      // data['challenges'] != null
      //     ?
      //     : null
      );
  return currentUser;
}

class CurrentUser {
  String? uid;
  String? email;
  String? name;
  String? avatar;
  List<Challenges>? challenges;

  CurrentUser({this.uid, this.email, this.name, this.avatar, this.challenges});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    if (json['challenges'] != null) {
      challenges = <Challenges>[];
      json['challenges'].forEach((v) {
        challenges!.add(new Challenges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    if (this.challenges != null) {
      data['challenges'] = this.challenges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Challenges {
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

  Challenges(
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

  Challenges.fromJson(Map<String, dynamic> json) {
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
