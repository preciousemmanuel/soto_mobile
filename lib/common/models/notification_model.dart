import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  final String? id;
  final String? sender;
  final String? receiver;
  final String? type;
  final bool? status;
  final String? content;
  final String? title;
  final bool? deleted;
  final bool? isRead;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  NotificationModel({
    this.id,
    this.sender,
    this.receiver,
    this.type,
    this.status,
    this.content,
    this.title,
    this.deleted,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["_id"],
        sender: json["sender"],
        receiver: json["receiver"],
        type: json["type"],
        status: json["status"],
        content: json["content"],
        title: json["title"],
        deleted: json["deleted"],
        isRead: json["is_read"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender,
        "receiver": receiver,
        "type": type,
        "status": status,
        "content": content,
        "title": title,
        "deleted": deleted,
        "is_read": isRead,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
