import 'dart:core';
import 'package:bank/src/models/page_info.dart';
import 'package:dio/dio.dart';
import 'client.dart';

final BankApiClient bankApiClient = BankApiClient();

class BankApiClient with Client {
  Future<Response> listBank(PageRequest page) async {
    return httpClient.get('/bank/v1/banks', queryParameters: page.toJson());
  }

  Future<Response> listInterestrates(
    PageRequest page,
    Map<String, dynamic> params,
  ) async {
    Map<String, dynamic> pageParams = page.toJson();
    pageParams.addAll(params);
    return httpClient.get('/bank/v1/interestrates',
        queryParameters: pageParams);
  }

  Future<Response> errorBank(PageRequest page) async {
    return httpClient.get('/bank/v1/error', queryParameters: page.toJson());
  }
}
