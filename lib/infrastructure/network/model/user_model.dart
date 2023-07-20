class UserModel {
  bool? success;
  UserData? data;
  String? message;

  UserModel({this.success, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  int? id;
  dynamic name;
  String? countryCode;
  String? phone;
  dynamic password;
  String? deviceToken;
  String? deviceType;
  String? isAvailable;
  dynamic profilePic;
  dynamic lat;
  dynamic long;
  String? createdAt;
  dynamic updatedAt;
  dynamic identityVerification;
  dynamic vehicleVerification;
  dynamic personalVerification;
  String? token;
  String? refreshToken;
  bool? isNewUser;

  UserData(
      {this.id,
      this.name,
      this.countryCode,
      this.phone,
      this.password,
      this.deviceToken,
      this.deviceType,
      this.isAvailable,
      this.profilePic,
      this.lat,
      this.long,
      this.createdAt,
      this.updatedAt,
      this.identityVerification,
      this.vehicleVerification,
      this.personalVerification,
      this.token,
      this.refreshToken,
      this.isNewUser});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    password = json['password'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    isAvailable = json['is_available'];
    profilePic = json['profile_pic'] ?? "";
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    identityVerification = json['identity_verification'];
    vehicleVerification = json['vehicle_verification'];
    personalVerification = json['personal_verification'];
    token = json['token'];
    refreshToken = json['refreshToken'];
    isNewUser = json['is_newUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    data['is_available'] = this.isAvailable;
    data['profile_pic'] = this.profilePic;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['identity_verification'] = this.identityVerification;
    data['vehicle_verification'] = this.vehicleVerification;
    data['personal_verification'] = this.personalVerification;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    data['is_newUser'] = this.isNewUser;
    return data;
  }
}
