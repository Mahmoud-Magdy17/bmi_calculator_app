import 'package:bmi_calculator/assets/colors.dart';
import 'package:bmi_calculator/interfaces/home_page.dart';
import 'package:bmi_calculator/interfaces/result_page.dart';
import 'package:bmi_calculator/provider/my_app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppProvider(),
        child: MaterialApp(
          routes: {
            HomeInterface.routeName: (context) => HomeInterface(),
            ResultPage.routeName: (context) => ResultPage(),
          },
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: darkRed,
            appBar: AppBar(
              centerTitle: true,
              title: const Text("BMI CACLULATOR"),
            ),
            body: const HomeInterface(),
          ),
        ));
  }
}
