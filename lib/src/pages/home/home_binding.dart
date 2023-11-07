import 'package:bank/src/pages/bank/bank_logic.dart';
import 'package:bank/src/pages/home/home_logic.dart';
import 'package:bank/src/pages/interestrate/interestrate_logic.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => BankLogic());
    Get.lazyPut(() => InterestRateLogic());
  }
}
