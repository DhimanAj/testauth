class CountryModel {
  int? status;
  List<Country>? country;
  String? message;

  CountryModel({this.status, this.country, this.message});

  CountryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      country = <Country>[];
      json['data'].forEach((v) {
        country!.add(Country.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (country != null) {
      data['data'] = country!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  int? dialCode;
  String? code;
  String? currencyCode;
  String? flag;

  Country(
      {this.id,
      this.name,
      this.dialCode,
      this.code,
      this.currencyCode,
      this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dialCode = json['dialCode'];
    code = json['code'];
    currencyCode = json['currencyCode'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dialCode'] = dialCode;
    data['code'] = code;
    data['currencyCode'] = currencyCode;
    data['flag'] = flag;
    return data;
  }
}
