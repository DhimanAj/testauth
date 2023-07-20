class NotificationModel {
  bool? success;
  Data? data;
  String? message;

  NotificationModel({this.success, this.data, this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<Notificatios>? notificatios;
  Pagination? pagination;

  Data({this.notificatios, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['notificatios'] != null) {
      notificatios = <Notificatios>[];
      json['notificatios'].forEach((v) {
        notificatios!.add(new Notificatios.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificatios != null) {
      data['notificatios'] = this.notificatios!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Notificatios {
  int? id;
  int? userId;
  String? userType;
  String? type;
  dynamic typeId;
  String? title;
  String? message;
  int? isRead;
  String? createdAt;

  Notificatios(
      {this.id,
        this.userId,
        this.userType,
        this.type,
        this.typeId,
        this.title,
        this.message,
        this.isRead,
        this.createdAt});

  Notificatios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userType = json['user_type'];
    type = json['type'];
    typeId = json['type_id'];
    title = json['title'] ?? "";
    message = json['message'] ?? "";
    isRead = json['is_read'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['type'] = this.type;
    data['type_id'] = this.typeId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['is_read'] = this.isRead;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Pagination {
  int? total;
  int? lastPage;
  int? perPage;
  int? currentPage;
  int? from;
  int? to;

  Pagination(
      {this.total,
        this.lastPage,
        this.perPage,
        this.currentPage,
        this.from,
        this.to});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    lastPage = json['lastPage'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['lastPage'] = this.lastPage;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
