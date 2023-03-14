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
    required this.id,
    this.name,
    this.tag,
    this.address,
    this.tele,
    this.image,
    required this.latitude,
    required this.longitude,
  });

  factory ExploreData.fromJson(Map<String, dynamic> json) => ExploreData(
        id: json["id"] ?? 0,
        name: json["name"] ?? "-",
        tag: json["tag"] ?? "-",
        address: json["address"] ?? "-",
        tele: json["tele"] ?? "-",
        image: json["image"] ?? "-",
        latitude: json["latitude"],
        longitude: json["longitude"],
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
