import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../shared_pref/shared_pref_util.dart';

class RefreshTokenAPI {
  String id;

  RefreshTokenAPI({required this.id});

  Future<Either<http.Response, String>> run() async {
    String urlToken =
        'https://clients.inovacetech.com/inovace-client/api/v1/auth/refresh';

    var json;
    String tokenString = await SharedPrefUtil().getAPIRefreshToken();
    json = jsonEncode(<String, String>{
      'refreshToken': tokenString,
      'userId': id,
    });

    print(urlToken);
    print(json);
    http.Response responseForToken = await http
        .post(
          Uri.parse(urlToken),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json,
        )
        .timeout(Duration(seconds: 60));
    return Left(responseForToken);
  }
}
