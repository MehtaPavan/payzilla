import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import './models/database_provider.dart';
import 'package:provider/provider.dart';
// screens
import './screens/category_screen.dart';
import './screens/expense_screen.dart';
import './screens/all_expenses.dart';
import 'package:payzilla/Homescreen.dart';

import 'currency/utils/theme.dart';
import 'currency/views/screens/history_page.dart';
import 'currency/views/screens/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DatabaseProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const Homescreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/Frame 2.png')
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 580,),
              const CircularProgressIndicator(
                color: Color(0xff083159),
              )
            ],
          )
      ),
    );
  }
}

class expenseapp extends StatelessWidget {
  const expenseapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.name,
      routes: {
        CategoryScreen.name: (_) => const CategoryScreen(),
        ExpenseScreen.name: (_) => const ExpenseScreen(),
        AllExpenses.name: (_) => const AllExpenses(),
      },
    );
  }
}


class Curr extends StatefulWidget {
  const Curr({Key? key}) : super(key: key);

  @override
  State<Curr> createState() => _CurrState();
}

class _CurrState extends State<Curr> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          getPages: [
            GetPage(name: "/", page: () => CurrencyPage()),
            GetPage(name: "/history_page", page: () => const HistoryPage()),
          ],
        );
    }
  }




