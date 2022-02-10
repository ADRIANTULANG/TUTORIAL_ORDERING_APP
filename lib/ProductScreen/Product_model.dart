import 'dart:convert';

List<TemporyProductModel> temporaryModelFromJson(String str) =>
    List<TemporyProductModel>.from(
        json.decode(str).map((x) => TemporyProductModel.fromJson(x)));

String temporaryModelToJson(List<TemporyProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TemporyProductModel {
  TemporyProductModel({
    required this.categoryid,
    required this.categoryname,
    required this.categoryimage,
    required this.categorystoreid,
    required this.productid,
    required this.productname,
    required this.productimage,
    required this.productPrice,
    required this.productStoreId,
    required this.productCategoryid,
  });

  String categoryid;
  String categoryname;
  String categoryimage;
  String categorystoreid;
  String productid;
  String productname;
  String productimage;
  String productPrice;
  String productStoreId;
  String productCategoryid;

  factory TemporyProductModel.fromJson(Map<String, dynamic> json) =>
      TemporyProductModel(
        categoryid: json["categoryid"],
        categoryname: json["categoryname"],
        categoryimage: json["categoryimage"],
        categorystoreid: json["categorystoreid"],
        productid: json["productid"],
        productname: json["productname"],
        productimage: json["productimage"],
        productPrice: json["productPrice"],
        productStoreId: json["productStoreID"],
        productCategoryid: json["productCategoryid"],
      );

  Map<String, dynamic> toJson() => {
        "categoryid": categoryid,
        "categoryname": categoryname,
        "categoryimage": categoryimage,
        "categorystoreid": categorystoreid,
        "productid": productid,
        "productname": productname,
        "productimage": productimage,
        "productPrice": productPrice,
        "productStoreID": productStoreId,
        "productCategoryid": productCategoryid,
      };
}

List<FinalProductModel> finalProductModelFromJson(String str) =>
    List<FinalProductModel>.from(
        json.decode(str).map((x) => FinalProductModel.fromJson(x)));

String finalProductModelToJson(List<FinalProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinalProductModel {
  FinalProductModel({
    required this.categoryid,
    required this.categoryname,
    required this.categoryimage,
    required this.categorystoreid,
    required this.categoryproducts,
  });

  String categoryid;
  String categoryname;
  String categoryimage;
  String categorystoreid;
  List<Categoryproduct> categoryproducts;

  factory FinalProductModel.fromJson(Map<String, dynamic> json) =>
      FinalProductModel(
        categoryid: json["categoryid"],
        categoryname: json["categoryname"],
        categoryimage: json["categoryimage"],
        categorystoreid: json["categorystoreid"],
        categoryproducts: List<Categoryproduct>.from(
            json["categoryproducts"].map((x) => Categoryproduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryid": categoryid,
        "categoryname": categoryname,
        "categoryimage": categoryimage,
        "categorystoreid": categorystoreid,
        "categoryproducts":
            List<dynamic>.from(categoryproducts.map((x) => x.toJson())),
      };
}

class Categoryproduct {
  Categoryproduct({
    required this.productid,
    required this.productname,
    required this.productPrice,
    required this.productimage,
    required this.productCategoryid,
    required this.productStoreId,
  });

  String productid;
  String productname;
  String productPrice;
  String productimage;
  String productCategoryid;
  String productStoreId;

  factory Categoryproduct.fromJson(Map<String, dynamic> json) =>
      Categoryproduct(
        productid: json["productid"],
        productname: json["productname"],
        productPrice: json["productPrice"],
        productimage: json["productimage"],
        productCategoryid: json["productCategoryid"],
        productStoreId: json["productStoreId"],
      );

  Map<String, dynamic> toJson() => {
        "productid": productid,
        "productname": productname,
        "productPrice": productPrice,
        "productimage": productimage,
        "productCategoryid": productCategoryid,
        "productStoreId": productStoreId,
      };
}
