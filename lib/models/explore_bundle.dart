import 'dart:convert';

class ExploreBundle {
  ExploreBundle({
    required this.id,
    required this.name,
    required this.tag,
    required this.address,
    required this.tele,
    required this.image,
    required this.latitude,
    required this.longitude,
  });

  final int id;
  final String name;
  final String tag;
  final String address;
  final String tele;
  final String image;
  final double latitude;
  final double longitude;

  factory ExploreBundle.fromRawJson(String element) =>
      ExploreBundle.fromJson(json.decode(element));

  String toRawJson() => json.encode(toJson());

  factory ExploreBundle.fromJson(Map<String, dynamic> json) => ExploreBundle(
        id: json["id"] ?? 0,
        name: json["name"] ?? "-",
        tag: json["tag"] ?? "-",
        address: json["address"] ?? "-",
        tele: json["tele"] ?? "-",
        image: json["image"] ?? "-",
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
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
