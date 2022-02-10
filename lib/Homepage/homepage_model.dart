import 'dart:convert';

List<TopthreeStore> topthreeStoreFromJson(String str) =>
    List<TopthreeStore>.from(
        json.decode(str).map((x) => TopthreeStore.fromJson(x)));

String topthreeStoreToJson(List<TopthreeStore> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopthreeStore {
  TopthreeStore({
    required this.storeid,
    required this.storename,
    required this.storeimage,
    required this.isStoreTopThree,
    required this.isStorePopular,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  String storeid;
  String storename;
  String storeimage;
  String isStoreTopThree;
  String isStorePopular;
  String latitude;
  String longitude;
  String address;

  factory TopthreeStore.fromJson(Map<String, dynamic> json) => TopthreeStore(
        storeid: json["storeid"],
        storename: json["storename"],
        storeimage: json["storeimage"],
        isStoreTopThree: json["isStore_top_three"],
        isStorePopular: json["isStore_Popular"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "storeid": storeid,
        "storename": storename,
        "storeimage": storeimage,
        "isStore_top_three": isStoreTopThree,
        "isStore_Popular": isStorePopular,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
      };
}

// -----------------------------------------------------------------------
List<PopularStores> popularStoresFromJson(String str) =>
    List<PopularStores>.from(
        json.decode(str).map((x) => PopularStores.fromJson(x)));

String popularStoresToJson(List<PopularStores> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularStores {
  PopularStores({
    required this.storeid,
    required this.storename,
    required this.storeimage,
    required this.isStoreTopThree,
    required this.isStorePopular,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  String storeid;
  String storename;
  String storeimage;
  String isStoreTopThree;
  String isStorePopular;
  String latitude;
  String longitude;
  String address;

  factory PopularStores.fromJson(Map<String, dynamic> json) => PopularStores(
        storeid: json["storeid"],
        storename: json["storename"],
        storeimage: json["storeimage"],
        isStoreTopThree: json["isStore_top_three"],
        isStorePopular: json["isStore_Popular"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "storeid": storeid,
        "storename": storename,
        "storeimage": storeimage,
        "isStore_top_three": isStoreTopThree,
        "isStore_Popular": isStorePopular,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
      };
}
//----------------------------------------------------------------------------------

List<AllStores> allStoresFromJson(String str) =>
    List<AllStores>.from(json.decode(str).map((x) => AllStores.fromJson(x)));

String allStoresToJson(List<AllStores> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllStores {
  AllStores({
    required this.storeid,
    required this.storename,
    required this.storeimage,
    required this.isStoreTopThree,
    required this.isStorePopular,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  String storeid;
  String storename;
  String storeimage;
  String isStoreTopThree;
  String isStorePopular;
  String latitude;
  String longitude;
  String address;

  factory AllStores.fromJson(Map<String, dynamic> json) => AllStores(
        storeid: json["storeid"],
        storename: json["storename"],
        storeimage: json["storeimage"],
        isStoreTopThree: json["isStore_top_three"],
        isStorePopular: json["isStore_Popular"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "storeid": storeid,
        "storename": storename,
        "storeimage": storeimage,
        "isStore_top_three": isStoreTopThree,
        "isStore_Popular": isStorePopular,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
      };
}
