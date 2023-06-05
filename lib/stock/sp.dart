import 'package:payzilla/stock/actionHistory.dart';
import 'package:payzilla/stock/company.dart';
import 'package:payzilla/stock/currentUser.dart';
import 'package:payzilla/stock/investment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';


void saveData(List<Investment> investments, List<Company> companies,
    List<ActionItem> history) {
  _save(
      "investments",
      investments.map((Investment investment) {
        return jsonEncode(investment.toJson());
      }).toList());

  _save(
      "companies",
      companies.map((Company company) {
        return jsonEncode(company.toJson());
      }).toList());

  _save(
      "history",
      history.map((ActionItem actionItem) {
        return jsonEncode(actionItem.toJson());
      }).toList());

  _save("currentUser", [jsonEncode(CurrentUser.toJson())]);
}

void getData(Function callback) {
  _read("currentUser", (List<String> currentUserArray) {
    CurrentUser.loadFromJson(jsonDecode(currentUserArray[0]));
  });

  //Investments
  _read("investments", (List<String> investments) {
    //Companies
    _read("companies", (List<String> companies) {
      //History
      _read("history", (List<String> history) {
        callback(
            investments.map((String e) {
              return Investment.fromJson(jsonDecode(e) as Map<String, Object>);
            }).toList(),
            companies.map((String e) {
              return Company.fromJson(jsonDecode(e) as Map<String, Object>);
            }).toList(),
            history.map((String e) {
              return ActionItem.fromJson(jsonDecode(e) as Map<String, Object>);
            }).toList());
      });
    });
  });
}

Object _read(String key, Function callback) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getStringList(key);
  callback(value);
  return null;
}

_save(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(key, value);
}
