import 'package:flutter/material.dart';


import 'dart:async';

class UserModel {
  final String name;
  final String image;
  final String trailer;
  final String actors;
  final String decriptions;
  final String category;
  UserModel(
      {required this.name,
      required this.image,
      required this.trailer,
      required this.actors,
      required this.decriptions,
      required this.category});

  // Factory method to create a Movie from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['NAMES'],
      image: json['IMAGE LINKS'],
      trailer: json['TRAILER LINKS'],
      actors: json['ACTORS'],
      decriptions: json['DESCRIPTIONS'],
      category: json['CATEGORIES'],
    );
  }
}

List<UserModel> movies = [];
Future<void>? movieFuture;
