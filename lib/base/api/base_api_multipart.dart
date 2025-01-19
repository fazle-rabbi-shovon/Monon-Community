import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
// import 'package:inhrm/app/util/error_handler.dart';

import '../../shared_pref/shared_pref_util.dart';

class BaseAPIMultipart {
  String url;
  String? fileName;
  var json;
  bool isProfilePicUpload;

  BaseAPIMultipart(
      {required this.url,
      this.fileName,
      this.json,
      required this.isProfilePicUpload});

  Future<Either<http.Response, String>> run() async {
    print('URL: ' + url);
    print(json);
    if (isProfilePicUpload) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );

      request.headers.addAll(await SharedPrefUtil().getAuthHeaders());

      request.files.add(await http.MultipartFile.fromPath('file', fileName!));

      // request.fields['postBody'] = json;

      var res = await request.send();

      if (res.statusCode == 401) {
        // ErrorHandler.onAuthError();

        return Right('Session expired or unauthorised.');
      }

      if (res.statusCode == 200) {
        print('Uploaded!');
      }

      return Left(await http.Response.fromStream(res));
    } else {
      if (fileName == null) {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(url),
        );

        request.headers.addAll(await SharedPrefUtil().getAuthHeaders());

        //request.files.add(await http.MultipartFile.fromPath('file', ""));

        request.fields['postBody'] = json;

        var res = await request.send();

        if (res.statusCode == 401) {
          // ErrorHandler.onAuthError();

          return Right('Session expired or unauthorised.');
        }

        if (res.statusCode == 200) {
          print('Uploaded!');
        }

        return Left(await http.Response.fromStream(res));
      } else {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(url),
        );

        request.headers.addAll(await SharedPrefUtil().getAuthHeaders());

        request.files.add(await http.MultipartFile.fromPath('file', fileName!));

        request.fields['postBody'] = json;

        var res = await request.send();

        if (res.statusCode == 401) {
          // ErrorHandler.onAuthError();

          return Right('Session expired or unauthorised.');
        }

        if (res.statusCode == 200) {
          print('Uploaded!');
        }

        return Left(await http.Response.fromStream(res));
      }
    }
  }
}
