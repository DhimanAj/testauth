import 'dart:convert';

import '../constants/app_constants.dart';
import '../network/model/user_model.dart';
import '../preference/preference_manager.dart';


class Utils {
  setUser(UserModel user) {
    PreferenceManager.setString(AppConstants.user, jsonEncode(user.toJson()));
  }

  Future<UserModel?> getUser() async {
    String? json = await PreferenceManager.getString(AppConstants.user);
    if (json.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }
}
