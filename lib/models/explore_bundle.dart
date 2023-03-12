import 'dart:convert';

class ExploreBundle {
  ExploreBundle({
    this.id,
    this.name,
    this.tag,
    this.address,
    this.tele,
    this.image,
    this.latitude,
    this.longitude,
  });

  final int? id;
  final String? name;
  final String? tag;
  final String? address;
  final String? tele;
  final String? image;
  final double? latitude;
  final double? longitude;

  factory ExploreBundle.fromRawJson(String str) =>
      ExploreBundle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExploreBundle.fromJson(Map<String, dynamic> json) => ExploreBundle(
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
