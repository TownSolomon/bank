import 'package:bank/src/models/bank.dart';
import 'package:bank/src/widgets/titlebar.dart';
import 'package:flutter/material.dart';

import '../enums/bank.dart';

class Bank extends StatelessWidget {
  final BankModel bankModel;

  const Bank({
    super.key,
    required this.bankModel,
  });

  @override
  Widget build(BuildContext context) {
    List<InterestRateGroupModel> groups = bankModel.interestRateGroups;

    var slivers = <Widget>[];
    for (InterestRateGroupModel group in groups) {
      RateType type = group.type;
      String label = group.label;
      List<InterestRateModel> interestRates = group.interestRates;

      slivers.add(
        SliverToBoxAdapter(
          child: ListTile(
            title: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            titleAlignment: ListTileTitleAlignment.titleHeight,
          ),
        ),
      );
      for(InterestRateModel interestRate in interestRates){
        slivers.add(
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(interestRate.label),
              trailing: Text(interestRate.rate.toString()),
            ),
          ),
        );
      }
      slivers.add(
        const SliverToBoxAdapter(
          child: Divider(),
        ),
      );
    }

    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: EnterpriseTitleBar.back(
        title: bankModel.label,
      ),
      body: CustomScrollView(
        slivers: slivers,
      ),
    );
  }
}
