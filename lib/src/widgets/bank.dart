import 'package:bank/src/models/bank.dart';
import 'package:bank/src/widgets/titlebar.dart';
import 'package:flutter/material.dart';

class Bank extends StatelessWidget {
  final BankModel bankModel;

  const Bank({
    super.key,
    required this.bankModel,
  });

  @override
  Widget build(BuildContext context) {
    List<InterestRateModel> interestRates = bankModel.interestRates;
    InterestRateModel interestRate = interestRates.firstOrNull!;
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: EnterpriseTitleBar.back(
        title: bankModel.label,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(interestRate.label),
              trailing: Text(interestRate.rate.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
