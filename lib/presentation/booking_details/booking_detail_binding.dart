import 'package:auth/presentation/booking_details/booking_detial_controller.dart';
import 'package:get/get.dart';

class BookingDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BookingDetailController>(() => BookingDetailController());
  }

}