import 'dart:convert';
import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../route/navigation_service.dart';
import '../../shared_pref/shared_pref_util.dart';
import 'api_method.dart';

class BaseAPI {
  APIMethod method;
  String url;
  var json;
  int timeout;
  bool? login;
  bool? refresh;

  BaseAPI(
      {required this.method,
      required this.url,
      this.json,
      this.timeout = 15,
      this.login,
      this.refresh});

  Future<Either<http.Response, String>> run() async {
    print(url);

    if (method == APIMethod.post) {
      print(json);

      http.Response response = await http
          .post(
            Uri.parse(url),
            headers: (login == null)
                ? await SharedPrefUtil().getAuthHeaders()
                : login!
                    ? await SharedPrefUtil().getLoginHeaders()
                    : await SharedPrefUtil().getAuthHeaders(),
            body: json,
          )
          .timeout(Duration(seconds: timeout));
      if (response.statusCode == 401 && refresh == null) {
        return Right(tokenValidationCheck(response));
      } else
        return Left(response);
    } else if (method == APIMethod.put) {
      print(json);

      http.Response response = await http
          .put(
            Uri.parse(url),
            headers: (login == null)
                ? await SharedPrefUtil().getAuthHeaders()
                : login!
                    ? await SharedPrefUtil().getLoginHeaders()
                    : await SharedPrefUtil().getAuthHeaders(),
            body: json,
          )
          .timeout(Duration(seconds: timeout));
      if (response.statusCode == 401 && refresh == null) {
        return Right(tokenValidationCheck(response));
      } else
        return Left(response);
    } else if (method == APIMethod.get) {
      http.Response response = await http
          .get(
            Uri.parse(url),
            headers: (login == null)
                ? await SharedPrefUtil().getAuthHeaders()
                : login!
                    ? await SharedPrefUtil().getLoginHeaders()
                    : await SharedPrefUtil().getAuthHeaders(),
          )
          .timeout(Duration(seconds: timeout));
      if (response.statusCode == 401 && refresh == null) {
        return Right(tokenValidationCheck(response));
      } else
        return Left(response);
    } else {
      return Right('API Operation Unsuccessful');
    }
  }

  String tokenValidationCheck(http.Response response) {
    var json = jsonDecode(response.body);
    String message = json['message'];
    if (message.toLowerCase().contains("jwt token")) {
      NavigationService.getCurrentState()?.pushReplacementNamed('/');
    }
    return "token validity gone";
  }
}
