import 'dart:convert';

List<DataList> dataListFromJson(String str) {
  final jsonData = json.decode(str);

  if (jsonData is List) {
    return jsonData.map((item) => DataList.fromJson(item)).toList();
  } else if (jsonData is Map<String, dynamic>) {
    return [DataList.fromJson(jsonData)];
  } else {
    throw FormatException("Invalid JSON format");
  }
}

String dataListToJson(List<DataList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataList {
  int? userId;
  int? id;
  String? title;

  DataList({
    this.userId,
    this.id,
    this.title,
  });

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };

  @override
  String toString() {
    return 'DataList{userId: $userId, id: $id, title: $title}';
  }
}
