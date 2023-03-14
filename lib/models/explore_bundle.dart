class ExploreBundle {
  ExploreBundle({
    required this.exploreDataList,
  });

  final List<ExploreData> exploreDataList;

  factory ExploreBundle.fromJson(List<dynamic> parsedJson) {
    List<ExploreData> exploreDataList = <ExploreData>[];
    exploreDataList =
        parsedJson.map((element) => ExploreData.fromJson(element)).toList();
    return new ExploreBundle(exploreDataList: exploreDataList);
  }
}

class ExploreData {
  ExploreData({
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

  factory ExploreData.fromJson(Map<String, dynamic> json) => ExploreData(
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
