import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';

class Profile {
  final String username;
  final String displayName;
  final String urlPic;
  final String phone;
  final String addres;

  Profile({
    required this.username,
    required this.displayName,
    required this.urlPic,
    required this.phone,
    required this.addres,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        username: json['username'],
        displayName: json['displayName'],
        urlPic: json["url_pic"],
        phone: json["085710303705"],
        addres: json['adderess']);
  }
}
