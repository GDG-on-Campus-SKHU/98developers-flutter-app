import 'dart:convert';

class ExploreBundle {
  final List<ExploreData> exploreBundle;

  ExploreBundle({
    required this.exploreBundle,
  });

  factory ExploreBundle.fromJson(List<dynamic> parsedJson) {
    List<ExploreData> exploreBundle = [];
    exploreBundle = parsedJson.map((e) => ExploreData.fromRawJson(e)).toList();

    return new ExploreBundle(exploreBundle: exploreBundle);
  }
}

class ExploreData {
  final int? id;
  final String? name;
  final String? tag;
  final String? address;
  final String? tele;
  final String? image;
  final double? latitude;
  final double? longitude;

  ExploreData({
    this.id,
    this.name,
    this.tag,
    this.address,
    this.tele,
    this.image,
    this.latitude,
    this.longitude,
  });

  factory ExploreData.fromRawJson(String str) =>
      ExploreData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExploreData.fromJson(Map<String, dynamic> json) => ExploreData(
        id: json["id"],
        name: json["name"],
        tag: json["tag"] ?? "",
        address: json["address"],
        tele: json["tele"] ?? "",
        image: json["image"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "address": address,
        "tele": tele,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
      };
}
