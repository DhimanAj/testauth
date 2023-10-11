import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../infrastructure/core/utils/progess_dailog.dart';
import '../../infrastructure/network/app_exception_handle.dart';
import '../../infrastructure/network/dio_client.dart';
import '../../infrastructure/shared/custom_http_exception.dart';

class AuthorPostController extends GetxController {
  ProgressDialog progressDialog = ProgressDialog();

  var postAuthorData = [].obs;
  var postData = [].obs;

  var appBarName = "User";
  var isPageLoad = false.obs;

  @override
  void onInit() {
    Future.delayed(Duration.zero, () async {
      await postAuthorApi();
      await postApi();
    });
    super.onInit();
  }

  postAuthorApi() async {
    progressDialog.show();

    try {
      var data = await DioClient.base().getPostAuthorApi();
      print(data.runtimeType);
      print(data);
      postAuthorData.addAll(data);
      print("success ${postAuthorData.value.length}");
      progressDialog.dismiss();
      // beersData.addAll(beersModel);
      postAuthorData.refresh();
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

  postApi() async {
    try {
      var data = await DioClient.base().getUserPostApi();
      print(data.runtimeType);
      print(data);
      postData.addAll(data);
      progressDialog.dismiss();
      // beersData.addAll(beersModel);
      postData.refresh();
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


  getAuthorName(int userId){
    for(int i =0 ; i< postAuthorData.length; i++){
      if(postAuthorData[i]["id"] == userId){
        return postAuthorData[i]["name"];
      }
    }
  }
}
