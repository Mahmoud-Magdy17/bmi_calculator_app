import "package:bmi_calculator/Widgets/weight_and_height.dart";
import "package:bmi_calculator/assets/colors.dart";
import "package:bmi_calculator/Widgets/gender.dart";
import "package:bmi_calculator/interfaces/result_page.dart";
import "package:bmi_calculator/models/data_model.dart";
import "package:bmi_calculator/provider/my_app_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class HomeInterface extends StatelessWidget {
  static const String routeName = 'home interface';
  const HomeInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyAppProvider>(context);
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
                          provider.changeGender(true);
                        },
                        child: Gender(
                          Gicon: Icons.male,
                          Gtype: "Male",
                          Gcolor: provider.isMale ? darkWhite : lightRed,
                        ),
                      ),

                      SizedBox(width: 20,),
                      ////////////////////////////
                      ///

                      ///
                      ///////////////////////////////

                      GestureDetector(
                        onTap: () {
                          provider.changeGender(false);
                        },
                        child: Gender(
                          Gicon: Icons.female,
                          Gtype: "Female",
                          Gcolor: provider.isMale ? lightRed : darkWhite,
                        ),
                      )
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
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
                                "${(provider.sliderValue * 100).toInt()}",
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
                            value: provider.sliderValue,
                            onChanged: (Value) {
                              provider.changeSliderValue(Value);
                            },
                          ),
                        ],
                      )),
                  Container(
                    height: 300,
                    child: Row(
                      children: [
                        WeightAndHeight(
                          heightOrWeight: 'WEIGHT',
                          count: provider.weight,
                          decrement: provider.weightDecrement,
                          increment: provider.weightIncrement,
                        ),
                        const Expanded(child: SizedBox()),
                        WeightAndHeight(
                          heightOrWeight: "AGE",
                          count: provider.age,
                          increment: provider.ageIncrement,
                          decrement: provider.ageDecrement,
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
                  height: provider.sliderValue,
                  isMale: provider.isMale,
                  weight: provider.weight.toDouble(),
                  age: provider.age,
                ),
              );
            },
            child: Container(
              color: Colors.cyan,
              height: 60,
              alignment: Alignment.center,
              child: const Text(
                "CALCULATE",
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
    );
  }
}
