import 'package:get/get.dart';

import '../../infrastructure/core/utils/progess_dailog.dart';
import '../../infrastructure/models/api_response_model.dart';
import '../../infrastructure/models/post_detail_model.dart';
import '../../infrastructure/network/app_exception_handle.dart';
import '../../infrastructure/network/dio_client.dart';
import '../../infrastructure/shared/custom_http_exception.dart';

class PostDetailController extends GetxController {
  ProgressDialog progressDialog = ProgressDialog();

  var postDetail = PostDetails().obs;

  var appBarName = "Post Detail";
  var id = 0;
  var isPageLoad = false.obs;

  @override
  void onInit() {
    id = Get.arguments[0];
    Future.delayed(Duration.zero, () async {
      await postDetailApi();
    });
    super.onInit();
  }

  postDetailApi() async {
    progressDialog.show();
    try {
      PostDetails postData = await DioClient.base().getUserPostDetailApi(id);
      postDetail.value = postData;
      progressDialog.dismiss();
    } on CustomHttpException catch (exception, code) {
      progressDialog.dismiss();
      AppExceptionHandle().showException(
          exception.code, exception.response, exception.exception,
          type: exception.type);
    } catch (e) {
      progressDialog.dismiss();
      print(e);
    }
  }
}
