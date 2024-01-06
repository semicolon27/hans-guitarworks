import 'package:get/get.dart';

class URequest {
  final String? url;

  URequest({this.url});

  // String get urlHit => url ?? MainConfig.urlApi;

  // Future<Map> serviceGetTerms() async {
  //   // await progressDialog.show();

  //   var resp = await CoreHttp(context: Get.context).makeHttpGet(urlHit);

  //   // progressDialog.update(message: 'HELLO');
  //   // await progressDialog.hide();

  //   return resp;
  // }

  // Future<Map> servicePostRegistration(Map jsonReq) async {
  //   await loadingDialog.show();
  //   Map jsonResp = {};
  //   try {
  //     jsonResp =
  //         await CoreHttp(context: Get.context, msgbox: progressDialogMode.show)
  //             .makeHttpPost(urlHit, jsonReq);
  //   } on Exception catch (e) {
  //     print('servicePostRegistration: $e');
  //   } finally {
  //     await loadingDialog.hide();
  //   }

  //   return jsonResp;
  // }

  // Future<Map> servicePostNoProgressDialog(Map jsonReq) async {
  //   await loadingDialog.hide();
  //   Map jsonResp = {};
  //   try {
  //     jsonResp =
  //         await CoreHttp(context: Get.context, msgbox: progressDialogMode.hide)
  //             .makeHttpPost(urlHit, jsonReq);
  //   } on Exception catch (e) {
  //     print(e);
  //   } finally {
  //     await loadingDialog.hide();
  //   }

  //   return jsonResp;
  // }

  // Future<Map> servicePostGuest(Map jsonReq,
  //     {bool progressDialog = false}) async {
  //   await loadingDialog.hide();
  //   Map jsonResp = {};
  //   try {
  //     jsonResp = (await CoreHttp(
  //             context: Get.context,
  //             msgbox: progressDialog
  //                 ? progressDialogMode.show
  //                 : progressDialogMode.hide)
  //         .makeHttpPost(urlHit, jsonReq, isGuest: true));
  //   } on Exception catch (e) {
  //     print(e);
  //   } finally {
  //     await loadingDialog.hide();
  //   }

  //   return jsonResp;
  // }

  // Future<Map> servicePostBprs(Map jsonReq, {bool progressDialog = false}) async {
  //   await loadingDialog.hide();
  //   Map jsonResp = {};
  //   try {
  //     jsonResp = (await CoreHttp(context: Get.context, msgbox: progressDialog ? progressDialogMode.show : progressDialogMode.hide)
  //         .makeHttpPost('${MainConfig.urlBprs}/${jsonReq['kdtrx']}', jsonReq, isBprs: true));
  //   } on Exception catch (e) {
  //     print(e);
  //   } finally {
  //     await loadingDialog.hide();
  //   }

  //   return jsonResp;
  // }
}
