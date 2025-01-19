import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class BaseResponseHandler {
  static void process<P>({
    String tag = 'Response',
    required Function(Map<String, dynamic>) decoder,
    required Either<Response, String> result,
    required Function(Response, int, P) onSuccess,
    required Function(String, int) onError,
  }) {
    result.fold(
      (response) {
        print('$tag: ' + response.body);
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          P p = decoder(json);
          onSuccess(response, response.statusCode, p);
        } else {
          var json = jsonDecode(response.body);
          String message = json['message'];
          onError(message, response.statusCode);
        }
      },
      (msg) {
        onError(msg, 0);
      },
    );
  }
}
