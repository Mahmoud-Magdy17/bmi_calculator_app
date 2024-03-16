import "package:bmi_calculator/Widgets/weight_and_height.dart";
import "package:bmi_calculator/assets/colors.dart";
import "package:bmi_calculator/Widgets/gender.dart";
import "package:bmi_calculator/interfaces/result_page.dart";
import "package:bmi_calculator/models/data_model.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class HomeInterface extends StatefulWidget {
  static const String routeName = 'home interface';
  const HomeInterface({super.key});

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  bool isMale = true;
  double sliderValue = 0;
  int weight = 0;
  int age = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          isMale = true;
                        },
                        child: Gender(
                          Gicon: Icons.male,
                          Gtype: "Male",
                          Gcolor: isMale ? darkWhite : lightRed,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          isMale = false;
                        },
                        child: Gender(
                          Gicon: Icons.female,
                          Gtype: "Female",
                          Gcolor: isMale ? lightRed : darkWhite,
                        ),
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: lightRed,
                          borderRadius: BorderRadius.circular(25)),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("HEIGHT",
                              style:
                                  TextStyle(fontSize: 20, color: lightWhite)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${(sliderValue * 100).toInt()}",
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.w700,
                                  color: lightWhite,
                                ),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(color: lightWhite),
                              )
                            ],
                          ),
                          Slider(
                              value: sliderValue,
                              onChanged: (Value) {
                                setState(() {});
                                sliderValue = Value;
                              })
                        ],
                      )),
                  Container(
                    height: 300,
                    child: Row(
                      children: [
                        WeightAndHeight(
                          heightOrWeight: 'WEIGHT',
                          count: weight,
                          decrement: weightDecrement,
                          increment: weightIncrement,
                        ),
                        Expanded(child: SizedBox()),
                        WeightAndHeight(
                          heightOrWeight: "AGE",
                          count: age,
                          increment: ageIncrement,
                          decrement: ageDecrement,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                ResultPage.routeName,
                arguments: Result(
                  height: sliderValue ,
                  isMale: this.isMale,
                  weight: this.weight.toDouble(),
                  age: this.age,
                ),
              );
            },
            child: Container(
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              color: Colors.cyan,
              height: 60,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }

  void weightIncrement() {
    setState(() {
      weight++;
    });
  }

  void weightDecrement() {
    setState(() {
      weight--;
    });
  }

  void ageIncrement() {
    setState(() {
      age++;
    });
  }

  void ageDecrement() {
    setState(() {
      age--;
    });
  }
}
