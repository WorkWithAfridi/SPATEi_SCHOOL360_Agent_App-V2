import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class LogInProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;

  set rememberMe(bool value) {
    _rememberMe = value;
    print(rememberMe);
    notifyListeners();
  }

  // late SchoolValidatorForLogInWithIdAndPassword
  //     schoolValidatorForLogInWithIdAndPassword;

  // Future<String> validateInstituteId(String SchoolId) async {
  //   String result = 'An Error Occurred. Please try again';
  //   try {
  //     String url = 'https://school360.family/service_bridge/getInstituteInfo';
  //     Response response = await post(Uri.parse(url), body: {
  //       "security_pin": '311556',
  //       'institute_id': SchoolId,
  //     });
  //     String data = response.body;
  //     var decodedJson = jsonDecode(data);
  //     schoolValidatorForLogInWithIdAndPassword =
  //         SchoolValidatorForLogInWithIdAndPassword.fromJson(decodedJson);
  //     print(schoolValidatorForLogInWithIdAndPassword.isSuccess.runtimeType);
  //     if (schoolValidatorForLogInWithIdAndPassword.isSuccess== true) {
  //       result = 'success';
  //     } else {
  //       result = schoolValidatorForLogInWithIdAndPassword.message.toString();
  //     }
  //   } catch (e) {}
  //   return result;
  // }


  // late StudentIdAndPasswordValidator studentIdAndPasswordValidator;
  //
  // Future<String> validateStudentIdAndPassword(String StudentId, String password, String schoolId) async {
  //   String result = 'An Error Occurred. Please try again';
  //   try {
  //     String url = 'https://school360.app/${schoolId}/service_bridge/studentLogin';
  //     Response response = await post(Uri.parse(url), body: {
  //       "security_pin": '311556',
  //       'password': password,
  //       'user_name':StudentId,
  //     });
  //     String data = response.body;
  //     var decodedJson = jsonDecode(data);
  //     studentIdAndPasswordValidator = StudentIdAndPasswordValidator.fromJson(decodedJson);
  //     print(studentIdAndPasswordValidator.message);
  //     if (studentIdAndPasswordValidator.isSuccess==true) {
  //       result = 'success';
  //     } else {
  //       result = studentIdAndPasswordValidator.message.toString();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return result;
  // }

  void resetInstitutionBool(){
    showInstitutionIdSuccess=false;
    showInstitutionIdError=false;
  }
  void resetStudentIdAndPassBool(){
    showCredentialsError=false;
    showCredentialsSuccess=false;
  }

  bool _showInstitutionIdError = false;
  bool _showInstitutionIdSuccess = false;

  bool _showCredentialsError = false;
  bool _showCredentialsSuccess = false;

  bool get showCredentialsError => _showCredentialsError;

  set showCredentialsError(bool value) {
    _showCredentialsError = value;
    notifyListeners();
  }

  bool get showInstitutionIdError => _showInstitutionIdError;

  set showInstitutionIdError(bool value) {
    _showInstitutionIdError = value;
    notifyListeners();
  }

  bool get showInstitutionIdSuccess => _showInstitutionIdSuccess;

  set showInstitutionIdSuccess(bool value) {
    _showInstitutionIdSuccess = value;
    notifyListeners();
  }

  bool get showCredentialsSuccess => _showCredentialsSuccess;

  set showCredentialsSuccess(bool value) {
    _showCredentialsSuccess = value;
    notifyListeners();
  }
}
