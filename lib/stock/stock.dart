import 'package:flutter/material.dart';
import 'package:payzilla/stock/stock_page.dart';

class Stock extends StatelessWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stockpage());
  }
}
