import 'package:flutter/material.dart';
import 'package:payzilla/crypto.dart';
import 'package:payzilla/widgets/crypto_page.dart';
import 'package:crypto/crypto.dart';
import 'package:payzilla/widgets/crypto_page.dart';

class Crypto extends StatelessWidget {
  const Crypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.cyan,
        ),
        debugShowCheckedModeBanner: false,
        home: const Cryptopage());
  }
}

