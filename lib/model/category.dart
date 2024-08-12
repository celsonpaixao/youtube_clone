import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String etag;
  final String channelId;
  final IconData? icon;

  Category({
    required this.id,
    required this.title,
    required this.etag,
    required this.channelId,
    this.icon,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map["id"],
      title: map["snippet"]["title"],
      etag: map["etag"],
      channelId: map["snippet"]["channelId"],
    );
  }
}
