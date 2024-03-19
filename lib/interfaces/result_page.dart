import 'package:bmi_calculator/assets/colors.dart';
import 'package:bmi_calculator/interfaces/home_page.dart';
import 'package:bmi_calculator/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultPage extends StatelessWidget {
  static String routeName = "result page";
  ResultPage({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Result;
    return Scaffold(
      backgroundColor: darkRed,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "YOUR RESULT",
              style: TextStyle(
                color: lightWhite,
                fontSize: 34,
              ),
            ),
            Container(
              height: 580,
              width: double.infinity,
              margin: EdgeInsets.only(left: 32, right: 32),
              decoration: BoxDecoration(
                color: darkWhite,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      args.isMale ? "Male" : "Female",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      "${args.getBMIdescribe()}",
                      style: TextStyle(color: lightRed, fontSize: 24),
                    ),
                    Text(
                      "${args.getBMIvalue().toInt()}",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      "${args.getBMIdescribe()} BMI range: ${args.getBMIrange()} kg/m",
                      style: const TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Text(
                        "You Have ${args.getBMIdescribe()} Body Weight",
                        style: TextStyle(color: lightRed, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Navigator.pop(context, HomeInterface.routeName);
              },
              child: Container(
                color: Colors.cyan,
                height: 60,
                alignment: Alignment.center,
                child: const Text(
                  "Re-CALCULATE Your BMI",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
