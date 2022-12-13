import 'dart:convert';

class StoreModel {
  StoreModel({
    required this.result,
    required this.message,
    required this.status,
  });

  List<Result>? result;
  String message;
  String status;

  factory StoreModel.fromJson(String str) =>
      StoreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoreModel.fromMap(Map<String, dynamic> json) => StoreModel(
        result: json["result"] == null
            ? null
            : List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "result": result == null
            ? null
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        "message": message == null ? null : message,
        "status": status == null ? null : status,
      };
}

class Result {
  Result({
    this.id,
    this.userId,
    this.storeName,
    this.storeAddress,
    this.day,
    this.hours,
    this.dateTime,
    this.openTime,
    this.closeTime,
    this.image,
  });

  String? id;
  String? userId;
  String? storeName;
  String? storeAddress;
  String? day;
  String? hours;
  String? dateTime;
  String? openTime;
  String? closeTime;
  String? image;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        storeName: json["store_name"] == null ? null : json["store_name"],
        storeAddress:
            json["store_address"] == null ? null : json["store_address"],
        day: json["day"] == null ? null : json["day"],
        hours: json["hours"] == null ? null : json["hours"],
        dateTime: json["date_time"] == null ? null : json["date_time"],
        openTime: json["open_time"] == null ? null : json["open_time"],
        closeTime: json["close_time"] == null ? null : json["close_time"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "store_name": storeName == null ? null : storeName,
        "store_address": storeAddress == null ? null : storeAddress,
        "day": day == null ? null : day,
        "hours": hours == null ? null : hours,
        "date_time": dateTime == null ? null : dateTime.toString(),
        "open_time": openTime == null ? null : openTime,
        "close_time": closeTime == null ? null : closeTime,
        "image": image == null ? null : image,
      };
}
