import 'package:auth/presentation/post_detail/post_detail_controller.dart';
import 'package:get/get.dart';

class PostDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailController());
  }

}