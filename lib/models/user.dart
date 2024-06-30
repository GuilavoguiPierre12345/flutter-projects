import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String image;
  String email;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.image,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["avatar"],
        email: json["email"]);
  }
}

Future<void> getUsers(
    {required int pageKey,
    required pageSize,
    required PagingController<int, User> pagingController}) async {
  List<User> users = [];

  http.Response response = await http.get(Uri.parse(
      "https://reqres.in/api/users?page=${pageKey}&per_page=${pageSize}"
  ));

  if (response.statusCode == 200) {
    dynamic data =
        jsonDecode(response.body); //transform le body en object Dart (map)
    List responsedata =
        data["data"]; // recuperation de la cle data du nouveau object map

    responsedata.forEach((user) => users.add(User.fromJson(user)));

    //verifier si c'est la derniere page
    final isLastPage = responsedata.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(users);
      debugPrint("next page");
    } else {
      final nextPageKey = pageKey + 1;
      pagingController.appendPage(users, nextPageKey);
    }
  }
}
