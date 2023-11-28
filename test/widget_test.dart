// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bank/src/apis/bank.dart';
import 'package:bank/src/commons/secret.dart';
import 'package:bank/src/models/bank.dart';
import 'package:bank/src/models/error_model.dart';
import 'package:bank/src/models/page_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

void main() async {
  try {
    Response response = await bankApiClient.listBank(PageRequest(current: 1, size: 10));
    ListBankResponse listBankResponse =
        ListBankResponse.fromJson(response.data);
    if (kDebugMode) {
      print(listBankResponse);
    }
  } on DioException catch (e) {
    ErrorResponse errorResponse = ErrorResponse.fromError(e);
    if (kDebugMode) {
      print(errorResponse);
    }
  }
}
