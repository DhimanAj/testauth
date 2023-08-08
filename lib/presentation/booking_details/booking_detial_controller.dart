import 'package:auth/infrastructure/constants/app_constants.dart';
import 'package:auth/infrastructure/models/booking_detail_model.dart';
import 'package:get/get.dart';

import '../../infrastructure/core/utils/progess_dailog.dart';
import '../../infrastructure/models/api_response_model.dart';
import '../../infrastructure/network/app_exception_handle.dart';
import '../../infrastructure/network/dio_client.dart';
import '../../infrastructure/shared/custom_http_exception.dart';

class BookingDetailController extends GetxController {
  ProgressDialog progressDialog = ProgressDialog();
  var bookedData = BookingDetailModel().obs;
  @override
  void onInit() {
    Future.delayed(Duration.zero, () async{
    await getBookedDetail();
    });
    super.onInit();
  }

  getBookedDetail() async {
    progressDialog.show();
    try {
      Map<String, dynamic> params = {};
      params['booking_id'] = 88;
      ApiResponseModel<BookingDetailModel> bookingDetailModel =
          await DioClient.base(deviceToken: AppConstants.token).bookingDetailApi(params);
      if (bookingDetailModel.status == 200) {
        bookedData.value = bookingDetailModel.data!;
        progressDialog.dismiss();
      }
      progressDialog.dismiss();
    } on CustomHttpException catch (exception, code) {
      progressDialog.dismiss();
      AppExceptionHandle().showException(exception.code, exception.response, exception.exception, type: exception.type);
    } catch (e) {
      progressDialog.dismiss();
      print(e);
    }
  }
}
