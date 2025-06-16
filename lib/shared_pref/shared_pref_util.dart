import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

// import '../../data/model/employee.dart';
import 'shared_pref_constants.dart';
import 'package:monon/string_val/strings_util_en.dart';

class SharedPrefUtil {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<int> getLastChecked() async {
    final SharedPreferences pref = await _pref;
    int result = pref.getInt(SharedPrefConstants.LAST_CHECKED) ?? 0;
    return result;
  }

  Future<void> setLastChecked(int currentTime) async {
    final SharedPreferences pref = await _pref;
    await pref.setInt(SharedPrefConstants.LAST_CHECKED, currentTime);
  }

  Future<bool> isLaunchedFirstTime() async {
    final SharedPreferences pref = await _pref;
    bool result = pref.getBool(SharedPrefConstants.FIRST_LAUNCH) ?? true;
    return result;
  }

  Future<bool> isFirstAttendance() async {
    final SharedPreferences pref = await _pref;
    bool result = pref.getBool(SharedPrefConstants.FIRST_ATTENDANCE) ?? false;
    return result;
  }

  Future<void> setFirstAttendance(bool firstAttendance) async {
    final SharedPreferences pref = await _pref;
    await pref.setBool(SharedPrefConstants.FIRST_ATTENDANCE, firstAttendance);
  }

  Future<bool> isLeaveAdjusted() async {
    final SharedPreferences pref = await _pref;
    bool result = pref.getBool(SharedPrefConstants.LEAVE_ADJUSTED) ?? false;
    return result;
  }

  Future<void> setLeaveAdjusted(bool leaveAdjusted) async {
    final SharedPreferences pref = await _pref;
    await pref.setBool(SharedPrefConstants.LEAVE_ADJUSTED, leaveAdjusted);
  }

  Future<bool> isPendingApprovalChanged() async {
    final SharedPreferences pref = await _pref;
    bool result =
        pref.getBool(SharedPrefConstants.LEAVE_APPROVE_CHANGE) ?? false;
    return result;
  }

  Future<void> setLeaveApprove(bool leaveAdjusted) async {
    final SharedPreferences pref = await _pref;
    await pref.setBool(SharedPrefConstants.LEAVE_APPROVE_CHANGE, leaveAdjusted);
  }

  Future<void> storeSignUpAdminID(int userId) async {
    final SharedPreferences pref = await _pref;
    await pref.setInt(SharedPrefConstants.SIGN_UP_ADMIN, userId);
  }

  Future<int> getSignUpAdminID() async {
    final SharedPreferences pref = await _pref;
    int result = pref.getInt(SharedPrefConstants.SIGN_UP_ADMIN) ?? 0;
    return result;
  }

  Future<void> setTheAppLaunchedFirstTime() async {
    final SharedPreferences pref = await _pref;
    await pref.setBool(SharedPrefConstants.FIRST_LAUNCH, false);
  }

  Future<void> storeAPIToken(String? token) async {
    final SharedPreferences pref = await _pref;
    await pref.setString(SharedPrefConstants.API_TOKEN_AUTH, token!);
  }

  Future<void> storeAPIrefreshToken(String? refreshToken) async {
    final SharedPreferences pref = await _pref;
    await pref.setString(SharedPrefConstants.API_REFRESH_TOKEN, refreshToken!);
  }

  Future<String> getAPIToken() async {
    final SharedPreferences pref = await _pref;
    String result = pref.getString(SharedPrefConstants.API_TOKEN_AUTH) ?? '';
    return result;
  }

  Future<String> getAPIRefreshToken() async {
    final SharedPreferences pref = await _pref;
    String result = pref.getString(SharedPrefConstants.API_REFRESH_TOKEN) ?? '';
    return result;
  }

  Future<void> clearAPITokens() async {
    final SharedPreferences pref = await _pref;
    await pref.setString(SharedPrefConstants.API_TOKEN_AUTH, 'logout');
    await pref.setString(SharedPrefConstants.API_REFRESH_TOKEN, 'logout');
    await pref.setString(SharedPrefConstants.EMPLOYEE, '');
    await pref.setInt(SharedPrefConstants.TEMP, 0);
  }

  // Future<Employee> getEmployeeInfo() async {
  //   final SharedPreferences pref = await _pref;
  //   String? userInfoJson = pref.getString(SharedPrefConstants.EMPLOYEE);
  //   return (userInfoJson == null || userInfoJson.isEmpty)
  //       ? Employee()
  //       : Employee.fromJson(jsonDecode(userInfoJson));
  // }

  // Future<int> getEmployeeId() async {
  //   final SharedPreferences pref = await _pref;
  //   String? userInfoJson = pref.getString(SharedPrefConstants.EMPLOYEE);
  //   return (userInfoJson == null)
  //       ? Employee().id
  //       : Employee.fromJson(jsonDecode(userInfoJson)).id;
  // }

  // Future<void> setEmployeeInfo(Employee? user) async {
  //   if (user != null) {
  //     final SharedPreferences pref = await _pref;
  //     String userInfoJson = jsonEncode(user.toJson());
  //     print("EMPLOYEE: " + userInfoJson);
  //     await pref.setString(SharedPrefConstants.EMPLOYEE, userInfoJson);
  //   }
  // }

  Future<void> storeEnrollmentPerson(int employeeId) async {
    final SharedPreferences pref = await _pref;
    await pref.setInt(SharedPrefConstants.ENROLL_EMPLOYEE, employeeId);
  }

  Future<int> getEnrollmentPerson() async {
    final SharedPreferences pref = await _pref;
    int result = pref.getInt(SharedPrefConstants.ENROLL_EMPLOYEE) ?? 0;
    return result;
  }

  Future<int> getMobilePunchTime() async {
    final SharedPreferences pref = await _pref;
    int time = pref.getInt(SharedPrefConstants.MOBILE_PUNCH_TIME) ?? 0;
    return time;
  }

  Future<void> setMobilePunchTime(int time) async {
    final SharedPreferences pref = await _pref;
    await pref.setInt(SharedPrefConstants.MOBILE_PUNCH_TIME, time);
  }

  Future<Map<String, String>> getLoginHeaders() async {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'ETag': Uuid().v4().toString(),
    };
  }

  Future<Map<String, String>> getAuthHeaders() async {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      SharedPrefConstants.API_TOKEN_AUTH: await SharedPrefUtil().getAPIToken(),
    };
  }

  Future<void> storeLastLoginMail(String mail) async {
    final SharedPreferences pref = await _pref;
    await pref.setString(SharedPrefConstants.LAST_LOGGED_MAIL, mail);
  }

  Future<void> storeLastLoginPass(String pass) async {
    final SharedPreferences pref = await _pref;
    await pref.setString(SharedPrefConstants.LAST_LOGGED_PASS, pass);
  }

  Future<String> getLastLoginMail() async {
    final SharedPreferences pref = await _pref;
    String result = pref.getString(SharedPrefConstants.LAST_LOGGED_MAIL) ?? '';
    return result;
  }

  Future<String> getLastLoginPass() async {
    final SharedPreferences pref = await _pref;
    String result = pref.getString(SharedPrefConstants.LAST_LOGGED_PASS) ?? '';
    return result;
  }

  Future<void> storeSuggestedEmails(List<String> mail) async {
    final SharedPreferences pref = await _pref;
    Set<String> uniqueEmails = mail.toSet();
    await pref.setStringList(
        SharedPrefConstants.LOGIN_EMAILS, uniqueEmails.toList());
  }

  Future<List<String>> getSuggestedEmails() async {
    final SharedPreferences pref = await _pref;
    List<String> result =
        pref.getStringList(SharedPrefConstants.LOGIN_EMAILS) ?? [];
    return result;
  }

  Future<Locale> setLocale(String languageCode) async {
    SharedPreferences pref = await _pref;
    await pref.setString(SharedPrefConstants.LANGUAGE_CODE, languageCode);
    return _locale(languageCode);
  }

  Future<void> tokenSet(bool token) async {
    SharedPreferences pref = await _pref;
    await pref.setBool(SharedPrefConstants.FIREBASE_TOKEN, token);
  }

  Future<bool?> isFirebaseTokenSet() async {
    SharedPreferences pref = await _pref;
    bool? isTokenSet = pref.getBool(SharedPrefConstants.FIREBASE_TOKEN) ?? false;
    return isTokenSet;
  }

  Future<Locale> getLocale() async {
    SharedPreferences pref = await _pref;
    String languageCode = pref.getString(SharedPrefConstants.LANGUAGE_CODE) ??
        StringsUtil.ENGLISH;
    return _locale(languageCode);
  }

  Future<void> storeFailedRefreshCount(int? token) async {
    final SharedPreferences pref = await _pref;
    await pref.setInt(SharedPrefConstants.TEMP, token!);
  }

  Future<int> getFailedRefreshCount() async {
    final SharedPreferences pref = await _pref;
    int result = pref.getInt(SharedPrefConstants.TEMP) ?? 0;
    return result;
  }

  Locale _locale(String languageCode) {
    switch (languageCode) {
      case StringsUtil.ENGLISH:
        return Locale(StringsUtil.ENGLISH, StringsUtil.US);
      case StringsUtil.BENGALI:
        return Locale(StringsUtil.BENGALI, null);
      default:
        return Locale(StringsUtil.ENGLISH, StringsUtil.US);
    }
  }

  Future<void> setLoggedIn() async {
    final SharedPreferences pref = await _pref;
    await pref.setBool(SharedPrefConstants.IS_LOGGED_IN, true);
  }

  Future<bool> getIsLoggedIn() async {
    final SharedPreferences pref = await _pref;
    bool? isLoggedIn = pref.getBool(SharedPrefConstants.IS_LOGGED_IN) ?? false;
    return isLoggedIn;
  }

  Future<void> setIsTntro() async {
    final SharedPreferences pref = await _pref;
    await pref.setBool(SharedPrefConstants.IS_INTRO, true);
  }

  Future<bool> getIsTntro() async {
    final SharedPreferences pref = await _pref;
    bool? isLoggedIn = pref.getBool(SharedPrefConstants.IS_INTRO) ?? false;
    return isLoggedIn;
  }



}
