import 'package:bank/src/enums/load.dart';
import 'package:bank/src/models/bank.dart';
import 'package:bank/src/models/page_info.dart';
import 'package:bank/src/utils/toaster.dart';
import 'package:bank/src/widgets/bank.dart';
import 'package:bank/src/widgets/svg_picture.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../apis/bank.dart';
import '../../models/error_model.dart';
import '../../widgets/cache_image.dart';

class BankLogic extends GetxController {
  var hasMore = false;
  var page = PageRequest(current: 1, size: 10);
  var list = <BankModel>[].obs;

  Future<bool> onRefresh() async {
    try {
      dio.Response response = await bankApiClient.listBank(page);
      ListBankResponse listBankResponse =
          ListBankResponse.fromJson(response.data);
      hasMore = listBankResponse.page.hasMore;
      list
        ..clear()
        ..addAll(listBankResponse.list)
        ..addAll(listBankResponse.list)
        ..addAll(listBankResponse.list);
      return true;
    } on DioException catch (e) {
      ErrorResponse errorResponse = ErrorResponse.fromError(e);
      return false;
    }
  }

  Future<LoadResult> onLoading() async {
    if (!hasMore) {
      return LoadResult.noData;
    }

    try {
      dio.Response response = await bankApiClient.listBank(page.nextPage());
      ListBankResponse listBankResponse =
          ListBankResponse.fromJson(response.data);
      hasMore = listBankResponse.page.hasMore;
      list.addAll(listBankResponse.list);
      return LoadResult.complete;
    } on DioException catch (e) {
      ErrorResponse errorResponse = ErrorResponse.fromError(e);
      Toaster.showError(errorResponse.message);
      return LoadResult.failed;
    }
  }

  Widget delegate(int index) {
    BankModel bankModel = list.elementAt(index);
    return InkWell(
      onTap: () => Get.to(() => Bank(bankModel: bankModel)),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5.r, vertical: 1.r),
        elevation: 1.r,
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: SizedBox(
            width: 50.w,
            child: CacheImage(
              url: bankModel.icon.url.medium,
              fit: BoxFit.fitWidth,
            ),
          ),
          title: Text(bankModel.label),
          subtitle: Text("中国"),
          trailing: const SvgIcon(
            assetName: "assets/svg/shield-check_line.svg",
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
