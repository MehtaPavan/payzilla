import 'package:flutter/material.dart';
import 'package:payzilla/stock/company.dart';
import 'package:payzilla/stock/currentUser.dart';
import 'package:payzilla/stock/investment.dart';
import 'package:payzilla/stock/newInvestment.dart';


class CompanyTile extends StatelessWidget {
  final List<Investment> _investments;
  final BuildContext rootContext;
  final Company company;
  final Function _stateUpdate;

  CompanyTile(
      this.company, this.rootContext, this._investments, this._stateUpdate);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        company.getName(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Container(
        alignment: Alignment.centerLeft,
        child: company.getInvestorByUserId(CurrentUser.getUserId()) != null
            ? Column(
                children: [
                  Text("Share count: ${company.getShareCount()}"),
                  Text(
                      "Hold percentage: ${(company.getInvestorByUserId(CurrentUser.getUserId())!.getNShares() / company.getShareCount()).toStringAsFixed(2)} %"),
                ],
              )
            : Text("Share count: ${company.getShareCount()}"),
      ),
      trailing: Text(
        "\₹${company.getMarketPrice().toStringAsFixed(2)}",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            context: rootContext,
            builder: (BuildContext context2) {
              return GestureDetector(
                onTap: () {},
                child: NewInvestment(company, _investments, _stateUpdate),
                behavior: HitTestBehavior.opaque,
              );
            });
      },
    );
  }
}
