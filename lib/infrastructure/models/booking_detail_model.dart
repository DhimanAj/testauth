import 'package:auth/infrastructure/models/api_response_model.dart';

class BookingDetailModel extends Serializable{
  int? id;
  String? bookingId;
  int? userId;
  int? hotelId;
  String? roomId;
  int? roomQty;
  int? guestQty;
  String? checkIn;
  String? checkOut;
  dynamic meals;
  String? tax;
  String? taxAmount;
  String? discount;
  String? discountPrice;
  String? promoCode;
  String? bookingAmount;
  String? totalAmount;
  dynamic paidAmount;
  String? guestName;
  String? email;
  String? phone;
  dynamic commission;
  dynamic roomCategory;
  String? paymentStatus;
  String? paymentType;
  String? transactionId;
  String? bookingStatus;
  String? createdAt;
  String? updatedAt;
  String? bookingDate;
  String? bookingTime;
  String? roomAmount;
  int? mealAmount;
  List<GetRoom>? getRoom;
  // List<Null>? getFood;

  BookingDetailModel(
      {this.id,
        this.bookingId,
        this.userId,
        this.hotelId,
        this.roomId,
        this.roomQty,
        this.guestQty,
        this.checkIn,
        this.checkOut,
        this.meals,
        this.tax,
        this.taxAmount,
        this.discount,
        this.discountPrice,
        this.promoCode,
        this.bookingAmount,
        this.totalAmount,
        this.paidAmount,
        this.guestName,
        this.email,
        this.phone,
        this.commission,
        this.roomCategory,
        this.paymentStatus,
        this.paymentType,
        this.transactionId,
        this.bookingStatus,
        this.createdAt,
        this.updatedAt,
        this.bookingDate,
        this.bookingTime,
        this.roomAmount,
        this.mealAmount,
        this.getRoom,
        // this.getFood
      });

  BookingDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    roomId = json['room_id'];
    roomQty = json['room_qty'];
    guestQty = json['guest_qty'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    meals = json['meals'];
    tax = json['tax'];
    taxAmount = json['tax_amount'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    promoCode = json['promo_code'];
    bookingAmount = json['booking_amount'];
    totalAmount = json['total_amount'];
    paidAmount = json['paid_amount'];
    guestName = json['guest_name'];
    email = json['email'];
    phone = json['phone'];
    commission = json['commission'];
    roomCategory = json['room_category'];
    paymentStatus = json['payment_status'];
    paymentType = json['payment_type'];
    transactionId = json['transaction_id'];
    bookingStatus = json['booking_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    roomAmount = json['room_amount'];
    mealAmount = json['meal_amount'];
    if (json['get_room'] != null) {
      getRoom = <GetRoom>[];
      json['get_room'].forEach((v) {
        getRoom!.add(new GetRoom.fromJson(v));
      });
    }
    // if (json['get_food'] != null) {
    //   getFood = <Null>[];
    //   json['get_food'].forEach((v) {
    //     getFood!.add(new Null.fromJson(v));
    //   });
    // }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['user_id'] = this.userId;
    data['hotel_id'] = this.hotelId;
    data['room_id'] = this.roomId;
    data['room_qty'] = this.roomQty;
    data['guest_qty'] = this.guestQty;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    data['meals'] = this.meals;
    data['tax'] = this.tax;
    data['tax_amount'] = this.taxAmount;
    data['discount'] = this.discount;
    data['discount_price'] = this.discountPrice;
    data['promo_code'] = this.promoCode;
    data['booking_amount'] = this.bookingAmount;
    data['total_amount'] = this.totalAmount;
    data['paid_amount'] = this.paidAmount;
    data['guest_name'] = this.guestName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['commission'] = this.commission;
    data['room_category'] = this.roomCategory;
    data['payment_status'] = this.paymentStatus;
    data['payment_type'] = this.paymentType;
    data['transaction_id'] = this.transactionId;
    data['booking_status'] = this.bookingStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['booking_date'] = this.bookingDate;
    data['booking_time'] = this.bookingTime;
    data['room_amount'] = this.roomAmount;
    data['meal_amount'] = this.mealAmount;
    if (this.getRoom != null) {
      data['get_room'] = this.getRoom!.map((v) => v.toJson()).toList();
    }
    // if (this.getFood != null) {
    //   data['get_food'] = this.getFood!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class GetRoom {
  int? id;
  int? bookingId;
  String? venderId;
  String? roomId;
  String? category;
  String? roomSize;
  String? roomRent;
  String? discountAmount;
  String? createdAt;
  String? updatedAt;

  GetRoom(
      {this.id,
        this.bookingId,
        this.venderId,
        this.roomId,
        this.category,
        this.roomSize,
        this.roomRent,
        this.discountAmount,
        this.createdAt,
        this.updatedAt});

  GetRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    venderId = json['vender_id'];
    roomId = json['room_id'];
    category = json['category'];
    roomSize = json['room_size'];
    roomRent = json['room_rent'];
    discountAmount = json['discount_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['vender_id'] = this.venderId;
    data['room_id'] = this.roomId;
    data['category'] = this.category;
    data['room_size'] = this.roomSize;
    data['room_rent'] = this.roomRent;
    data['discount_amount'] = this.discountAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
